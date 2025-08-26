////
////  MockCartService.swift
////  App-ChallengeTests
////
////  Created by Leonel Ferraz Hernandez on 22/08/25.
////

import Foundation
@testable import App_Challenge

final class MockCartService: CartServiceProtocol {

 
    var shouldFail: Bool = false

   
    var failOn: Set<String> = []

    
    private(set) var cartItems: [CartItem] = []

    
    func reset() { cartItems.removeAll() }
    func seed(_ items: [CartItem]) { cartItems = items }

    
    func add(productId: Int, qty: Int = 1) throws {
        try maybeFail("add", code: 1)
        guard qty > 0 else { return }

        if let idx = cartItems.firstIndex(where: { $0.productId == productId }) {
            cartItems[idx].qty += qty
        } else {
            cartItems.append(CartItem(productId: productId, qty: qty))
        }
    }

    func setQty(productId: Int, qty: Int) throws {
        try maybeFail("setQty", code: 2)

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
        try maybeFail("remove", code: 3)
        cartItems.removeAll { $0.productId == productId }
    }

    func find(_ productId: Int) throws -> CartItem? {
        try maybeFail("find", code: 4)
        return cartItems.first { $0.productId == productId }
    }

    
    private func maybeFail(_ where_: String, code: Int) throws {
        if shouldFail || failOn.contains(`where_`) {
            throw NSError(domain: "MockCartService", code: code)
        }
    }
}
