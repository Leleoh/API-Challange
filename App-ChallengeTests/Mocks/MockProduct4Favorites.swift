//
//  Test.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 26/08/25.
//

import Testing
import Foundation
@testable import App_Challenge

final class MockProductServiceForFavorites: ProductServiceProtocol {
    var shouldFail = false
    var productsById: [Int: Product] = [:]
    
    func fetchProduct(number id: Int) async throws -> Product {
        if shouldFail { throw NSError(domain: "MockError", code: 1) }
        if let product = productsById[id] { return product }
        throw NSError(domain: "NotFound", code: 404)
    }
    
    func fetchProducts() async throws -> [Product] {
        Array(productsById.values)
    }
}
