//
//  Orders.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

// OrdersView.swift
import SwiftUI
import SwiftData

@MainActor
struct Orders: View {
    @Query(sort: [SortDescriptor(\Order.createdAt, order: .reverse)])
    private var orders: [Order]

    var body: some View {
        ScrollView {
            if orders.isEmpty {
                ContentUnavailableView("Sem pedidos",
                    systemImage: "shippingbox",
                    description: Text("Faça checkout do carrinho para ver seus pedidos aqui."))
            } else {
                LazyVStack(spacing: 16) {
                    ForEach(orders) { order in
                        // Cabeçalho do pedido
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Order • \(order.createdAt.formatted(date: .abbreviated, time: .shortened))")
                                .font(.headline)
                            Text("Total: US$ \(order.total, specifier: "%.2f")")
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)

                        // Itens do pedido
                        ForEach(order.items) { item in
                            // Monta um Product baseado no snapshot salvo
                            let product = Product(
                                id: item.productId,
                                title: item.title,
                                description: "",     // snapshot não precisa
                                category: "",        // snapshot não precisa
                                price: item.price,   // preço no momento da compra
                                thumbnail: item.thumbnail
                            )
                            ProductListOrders(product: product)
                                .overlay(
                                    // quantidade (se quiser exibir)
                                    Text("x\(item.qty)")
                                        .font(.caption)
                                        .padding(6)
                                        .background(.thinMaterial)
                                        .clipShape(Capsule())
                                        .padding(6),
                                    alignment: .topTrailing
                                )
                        }

                        Divider().padding(.horizontal, 16)
                    }
                }
                .padding(.top, 12)
            }
        }
        .navigationTitle("Orders")
    }
}
