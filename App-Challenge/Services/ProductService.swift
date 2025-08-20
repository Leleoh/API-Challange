//
//  ProductService.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 15/08/25.
//

import Foundation


class ProductService : ProductServiceProtocol {
    
    
    private let baseURL = "https://dummyjson.com"
    
    
    
    func fetchProduct(number: Int) async throws -> Product {
        let urlString: String = "\(baseURL)/product/\(number)"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let productResponse = try JSONDecoder().decode(Product.self, from: data)
        
        return productResponse
    }
    
    
    func fetchProducts() async throws -> [Product] {
        let urlString: String = "\(baseURL)/products/?limit=200"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(ProductResponse.self, from: data)
        print(response)
        
        return response.products
        
    }
}
