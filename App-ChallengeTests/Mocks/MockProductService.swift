//
//  MockProductService.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 22/08/25.
//

import Foundation
@testable import App_Challenge

final class MockProductService: ProductServiceProtocol {
    
    var shouldFail: Bool = false
    private var product: Product
    
    init(shoudFail: Bool = false){
        self.shouldFail = shoudFail
        self.product = Product(id: 0, title: "", description: "", category: "", price: 0, thumbnail: "")
    }
    
    
    
    func fetchProduct(number: Int) async throws -> App_Challenge.Product {
        if shouldFail{
            throw NSError(domain: #function, code: 1)
        }
        else{
            return product
        }
    }
    
    func fetchProducts() async throws -> [App_Challenge.Product] {
        if shouldFail{
            throw NSError(domain: #function, code: 2)
        }
        else{
            return [product]
        }
    }
    

    

}
