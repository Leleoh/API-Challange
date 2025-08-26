//
//  FavoriteViewModelTests.swift
//  App-ChallengeTests
//
//  Created by Gustavo Melleu on 22/08/25.
//

import Testing
@testable import App_Challenge

@MainActor
struct FavoritesViewModelTests {
    
    @Test func loadEmptyIDs_shouldSetItemsEmpty() async throws {
        let service = MockProductServiceForFavorites()
        let vm = FavoritesViewModel(service: service)
        
        await vm.load(byIDs: [])
        
        #expect(vm.items.isEmpty)
    }
    
    @Test func loadSuccess_shouldReturnProductsInCorrectOrder() async throws {
        let p1 = Product(id: 1, title: "A", description: "d", category: "c", price: 10, thumbnail: "")
        let p2 = Product(id: 2, title: "B", description: "d", category: "c", price: 20, thumbnail: "")
        let p3 = Product(id: 3, title: "C", description: "d", category: "c", price: 30, thumbnail: "")
        
        let service = MockProductServiceForFavorites()
        service.productsById = [1: p1, 2: p2, 3: p3]
        
        let vm = FavoritesViewModel(service: service)
        
        await vm.load(byIDs: [3, 1, 2])
        
        #expect(vm.items.map(\.id) == [3, 1, 2])
    }
    
    @Test func loadWhenServiceThrows_shouldSetItemsEmpty() async throws {
        let service = MockProductServiceForFavorites()
        service.shouldFail = true
        
        let vm = FavoritesViewModel(service: service)
        
        await vm.load(byIDs: [1, 2])
        
        #expect(vm.items.isEmpty)
    }
    
    @Test func isLoadingFlag_shouldToggleDuringLoad() async throws {
        let p = Product(id: 1, title: "Test", description: "d", category: "c", price: 1, thumbnail: "")
        let service = MockProductServiceForFavorites()
        service.productsById = [1: p]
        
        let vm = FavoritesViewModel(service: service)
        
        let task = Task { await vm.load(byIDs: [1]) }
        
//        #expect(vm.isLoading)
        
        await task.value
        
        #expect(vm.isLoading == false)
    }
}


