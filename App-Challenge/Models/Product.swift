//
//  Product.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 15/08/25.
//

import Foundation
import SwiftData



struct ProductResponse: Decodable {
    var products: [Product]
}



struct Product: Identifiable, Decodable{
    var id: Int
    var title: String
    var description: String
    var category: String
    var price: Double
    var thumbnail: String
    
    
    init(id: Int, title: String, description: String, category: String, price: Double, thumbnail: String) {
        self.id = id
        self.title = title
        self.description = description
        self.category = category
        self.price = price
        self.thumbnail = thumbnail
    }
}

@Model
class SavedProductRef {
    @Attribute(.unique) var productId: Int
    var isFavorite: Bool
    var savedAt: Date

    init(productId: Int, isFavorite: Bool = true, savedAt: Date = Date()) {
        self.productId = productId
        self.isFavorite = isFavorite
        self.savedAt = savedAt
    }
}

@Model
class CartItem {
    @Attribute(.unique) var productId: Int
    var qty: Int
    var addedAt: Date

    init(productId: Int, qty: Int = 1, addedAt: Date = Date()) {
        self.productId = productId
        self.qty = qty
        self.addedAt = addedAt
    }
}

@Model
class OrderItem{
    @Attribute(.unique) var id: UUID
    var products: [Int]
    var createdAt: Date
    
    init(products: [Int]) {
        self.id = UUID()
        self.products = products
        self.createdAt = Date()
    }
}
