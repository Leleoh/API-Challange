//
//  CategoriesViewModelTests.swift
//  App-ChallengeTests
//
//  Created by Gustavo Melleu on 26/08/25.
//

import Testing
@testable import App_Challenge

@MainActor
struct CategoriesViewModelTests {

    private func makeService() -> MockProductService {
        MockProductService()
    }

    @Test
    func loadProducts_success_populatesProductsAndSortedUniqueCategories() async {
        let s = makeService()
        s.seed([
            Product(id: 1, title: "A", description: "", category: "phones",  price: 1, thumbnail: ""),
            Product(id: 2, title: "B", description: "", category: "laptops", price: 2, thumbnail: ""),
            Product(id: 3, title: "C", description: "", category: "phones",  price: 3, thumbnail: "")
        ])

        let vm = CategoriesViewModel(service: s)
        await vm.loadProducts()

        #expect(vm.allProducts.map(\.id).sorted() == [1,2,3])
        // únicos e ordenados alfabeticamente
        #expect(vm.categories == ["laptops", "phones"])
    }

    @Test
    func loadProducts_failure_clearsState() async {
        let s = makeService()
        s.shouldFail = true

        let vm = CategoriesViewModel(service: s)
        await vm.loadProducts()

        #expect(vm.allProducts.isEmpty)
        #expect(vm.categories.isEmpty)
    }

    @Test
    func categories_areUniqueAndSorted_evenWithDuplicates() async {
        let s = makeService()
        s.seed([
            Product(id: 1, title: "A", description: "", category: "z", price: 1, thumbnail: ""),
            Product(id: 2, title: "B", description: "", category: "a", price: 2, thumbnail: ""),
            Product(id: 3, title: "C", description: "", category: "a", price: 3, thumbnail: "")
        ])

        let vm = CategoriesViewModel(service: s)
        await vm.loadProducts()

        #expect(vm.categories == ["a", "z"])
    }
}
