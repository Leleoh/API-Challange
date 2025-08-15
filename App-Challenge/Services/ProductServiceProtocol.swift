//
//  ProductServiceProtocol.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 15/08/25.
//

protocol ProductServiceProtocol{
    func fetchProduct(number: Int) async throws -> Product
    func fetchProducts() async throws -> [Product]
}
