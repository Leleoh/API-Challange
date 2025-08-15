//
//  Product.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 15/08/25.
//

import Foundation


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
}

