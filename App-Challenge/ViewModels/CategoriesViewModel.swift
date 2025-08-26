//
//  CategoriesViewModel.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 18/08/25.
//

import Foundation
import SwiftUI

//@MainActor
//class CategoriesViewModel: ObservableObject {
//    @Published var allProducts: [Product] = []
//    @Published var categories: [String] = []
//    
//    private let service: ProductServiceProtocol
//    
//    init(service: ProductServiceProtocol = ProductService()) {
//        self.service = service
//    }
//    
//    func loadProducts() async {
//        do {
//            let url = URL(string: "https://dummyjson.com/products?limit=200")!
//            let (data, _) = try await URLSession.shared.data(from: url)
//            let response = try JSONDecoder().decode(ProductResponse.self, from: data)
//            self.allProducts = response.products
//            let uniqueCategories = Set(response.products.map { $0.category })
//            self.categories = Array(uniqueCategories).sorted()
//            
//            
//            print(" Produtos carregados: \(response.products.count)")
//        } catch {
//            print(" Erro ao carregar produtos: \(error)")
//        }
//    }
//}

@MainActor
final class CategoriesViewModel: ObservableObject {
    @Published var allProducts: [Product] = []
    @Published var categories: [String] = []

    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol = ProductService()) { self.service = service }

    func loadProducts() async {
        do {
            let list = try await service.fetchProducts()
            allProducts = list
            categories = Array(Set(list.map(\.category))).sorted()
        } catch {
            allProducts = []
            categories = []
       
        }
    }
}
