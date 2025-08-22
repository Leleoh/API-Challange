//
//  App_ChallengeTests.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 21/08/25.
//

import Testing
@testable import App_Challenge

struct App_ChallengeTests {

    @Test func fetchProducts() async throws {
        
        let service = MockProductService(shoudFail: false)
        let viewModel = ProductViewModel(service: service)
        
        await viewModel.loadProducts()
        
        #expect(!viewModel.products.isEmpty)
        #expect(viewModel.product != nil)
        #expect(viewModel.errorMessage == nil)
    }
    
    
    @Test func fetchProductsShouldFail() async throws {
        
        let service = MockProductService(shoudFail: true)
        let viewModel = ProductViewModel(service: service)
        
        await viewModel.loadProducts()
        
        #expect(viewModel.products.isEmpty)
        #expect(viewModel.product == nil)
        #expect(viewModel.errorMessage != nil)
    }
    

}
