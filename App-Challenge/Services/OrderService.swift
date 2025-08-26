//
//  OrderService.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 20/08/25.
//

import Foundation
// OrderService.swift
import SwiftData

struct OrderService {
    let ctx: ModelContext
    let productService: ProductServiceProtocol


    @MainActor
    func checkout() async throws -> Order {
       
        let cart = try ctx.fetch(FetchDescriptor<CartItem>())

        guard !cart.isEmpty else {
            throw NSError(domain: "OrderService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Carrinho vazio"])
        }

       
        var orderItems: [OrderItem] = []
        var total: Double = 0

        for c in cart {
            let p = try await productService.fetchProduct(number: c.productId)
            let item = OrderItem(
                productId: p.id,
                title: p.title,
                price: p.price,
                thumbnail: p.thumbnail,
                qty: c.qty
            )
            orderItems.append(item)
            total += Double(c.qty) * p.price
        }

  
        let order = Order(createdAt: Date(), total: total, items: orderItems)
        ctx.insert(order)

        
        cart.forEach { ctx.delete($0) }

        try ctx.save()
        return order
    }
}
