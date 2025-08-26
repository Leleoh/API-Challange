//
//  App_ChallengeTests.swift
//  App-ChallengeTests
//
//  Created by Leonel Ferraz Hernandez on 21/08/25.
//

import Testing
@testable import App_Challenge

struct App_ChallengeTests {

    @Test
    func fetchProducts_shouldFail() async {
        let service = MockProductService()
        service.shouldFail = true   // <- aqui é true

        let viewModel = ProductViewModel(service: service)
        await viewModel.loadProducts()

        #expect(viewModel.products.isEmpty)
        // #expect(viewModel.product == nil)
        #expect(viewModel.errorMessage != nil)
    }
    
    
    @Test func fetchProductsShouldFail() async throws {
        
//        let service = MockProductService(shoudFail: true)
        let service = MockProductService()
        service.shouldFail = true
        let viewModel = ProductViewModel(service: service)
        
        await viewModel.loadProducts()
        
        #expect(viewModel.products.isEmpty)
        #expect(viewModel.product == nil)
        #expect(viewModel.errorMessage != nil)
    }
    

}
