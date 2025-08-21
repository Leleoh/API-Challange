//
//  CartViewModel.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 20/08/25.
//

import Foundation
import SwiftUI
import SwiftData

@MainActor
class OrderViewModel: ObservableObject {
    @Published var products: [Product] = []

    private let service: ProductServiceProtocol
    
    init(products: [Product] = [], service: ProductServiceProtocol = ProductService()) {
        self.products = products
        self.service = service
    }
}

