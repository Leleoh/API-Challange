//
//  CartViewModel.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 20/08/25.
//

import SwiftUI
import SwiftData

@MainActor
final class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
 
    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol = ProductService()) { self.service = service }

    func reload(byIDs ids: [Int]) async {
        guard !ids.isEmpty else { products = []; return }
    
        do {
            var tmp: [Product] = []
            for id in ids {
              
                let p = try await service.fetchProduct(number: id)
                tmp.append(p)
            }
        
            let order = ids
            products = tmp.sorted {
                (order.firstIndex(of: $0.id) ?? .max) < (order.firstIndex(of: $1.id) ?? .max)
            }
            print(" carregados \(products.count) produtos")
        } catch {
            print(" erro ao carregar cart:", error)
            products = []
        }
    }
}
