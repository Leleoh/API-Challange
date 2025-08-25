//
//  CartViewModelTest.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 22/08/25.
//

import Testing
@testable import App_Challenge

@MainActor
struct CartViewModelTest {

   @Test func add() {
        #expect(CartViewModel().products.count > 0)
    }

}
