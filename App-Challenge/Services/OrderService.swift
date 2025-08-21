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

    /// Converte o carrinho atual em um pedido e limpa o carrinho
    @MainActor
    func checkout() async throws -> Order {
        // 1) pega todos os itens do carrinho
        let cart = try ctx.fetch(FetchDescriptor<CartItem>())

        guard !cart.isEmpty else {
            throw NSError(domain: "OrderService", code: 1, userInfo: [NSLocalizedDescriptionKey: "Carrinho vazio"])
        }

        // 2) busca snapshot dos produtos (via API) e monta OrderItems
        var orderItems: [OrderItem] = []
        var total: Double = 0

        for c in cart {
            // ajuste o método do seu service (id: ou number:)
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

        // 3) cria a Order
        let order = Order(createdAt: Date(), total: total, items: orderItems)
        ctx.insert(order)

        // 4) limpa o carrinho
        cart.forEach { ctx.delete($0) }

        try ctx.save()
        return order
    }
}
