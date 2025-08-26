////
////  MockProductService.swift
////  App-ChallengeTests
////
////  Created by Leonel Ferraz Hernandez on 22/08/25.
////
//
//import Foundation
//@testable import App_Challenge
//
//final class MockProductService: ProductServiceProtocol {
//    
//    var shouldFail: Bool = false
//    private var product: Product
//    
//    init(shoudFail: Bool = false){
//        self.shouldFail = shoudFail
//        self.product = Product(id: 0, title: "", description: "", category: "", price: 0, thumbnail: "")
//    }
//    
//    
//    
//    func fetchProduct(number: Int) async throws -> App_Challenge.Product {
//        if shouldFail{
//            throw NSError(domain: #function, code: 1)
//        }
//        else{
//            return product
//        }
//    }
//    
//    func fetchProducts() async throws -> [App_Challenge.Product] {
//        if shouldFail{
//            throw NSError(domain: #function, code: 2)
//        }
//        else{
//            return [product]
//        }
//    }
//    
//
//    
//
//}

import Foundation
@testable import App_Challenge

final class MockProductService: ProductServiceProtocol {
    var productsByID: [Int: Product] = [:]
    var failOnIDs: Set<Int> = []
    var shouldFail: Bool = false
    private(set) var calledIDs: [Int] = []

    func seed(_ products: [Product]) {
         productsByID = Dictionary(uniqueKeysWithValues: products.map { ($0.id, $0) })
     }

     func fetchProducts() async throws -> [Product] {
         if shouldFail { throw NSError(domain: "MockProductService.all", code: 0) }
         return Array(productsByID.values)
     }

    func fetchProduct(number id: Int) async throws -> Product {
        if shouldFail || failOnIDs.contains(id) {
            throw NSError(domain: "MockProductService", code: id)
        }
        calledIDs.append(id)
        guard let p = productsByID[id] else {
            throw NSError(domain: "MockProductService.missing", code: id)
        }
        return p
    }


}
