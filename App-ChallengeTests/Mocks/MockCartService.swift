//
//  MockCartService.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 22/08/25.
//

import Foundation
@testable import App_Challenge

final class MockCartService: CartServiceProtocol{
    
    var shouldFail: Bool = false
    private var cartItems: [CartItem] = []
    
    func add(productId: Int, qty: Int = 1) throws {
            if shouldFail { throw NSError(domain: "MockCartService", code: 1) }

            if let idx = cartItems.firstIndex(where: { $0.productId == productId }) {
                cartItems[idx].qty += qty
            } else {
                cartItems.append(CartItem(productId: productId, qty: qty))
            }
        }
        
        func setQty(productId: Int, qty: Int) throws {
            if shouldFail { throw NSError(domain: "MockCartService", code: 2) }

            if let idx = cartItems.firstIndex(where: { $0.productId == productId }) {
                if qty <= 0 {
                    cartItems.remove(at: idx)
                } else {
                    cartItems[idx].qty = qty
                }
            } else if qty > 0 {
                cartItems.append(CartItem(productId: productId, qty: qty))
            }
        }
        
        func remove(productId: Int) throws {
            if shouldFail { throw NSError(domain: "MockCartService", code: 3) }

            cartItems.removeAll { $0.productId == productId }
        }
        
        func find(_ productId: Int) throws -> CartItem? {
            if shouldFail { throw NSError(domain: "MockCartService", code: 4) }

            return cartItems.first { $0.productId == productId }
        }
    

    
    
   

}
