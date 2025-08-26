//
//  Orders.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI


import SwiftUI
import SwiftData

@MainActor
struct Orders: View {
    @Query(sort: [SortDescriptor(\Order.createdAt, order: .reverse)])
    private var orders: [Order]

    var body: some View {
        
        
        Group {
            if orders.isEmpty {
              OrdersEmptyState()
                   
            } else {
                ScrollView{
                    
                    LazyVStack(spacing: 16) {
                        ForEach(orders) { order in
                            
                            
                            ForEach(order.items) { item in
                                
                                let product = Product(
                                    id: item.productId,
                                    title: item.title,
                                    description: "",
                                    category: "",
                                    price: item.price,
                                    thumbnail: item.thumbnail
                                )
                                ProductListOrders(product: product, date: order.createdAt)
                                    .overlay(
                                        
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
        }
        .navigationTitle("Orders")
    }
}
