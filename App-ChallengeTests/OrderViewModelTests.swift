//
//  OrderViewModelTests.swift
//  App-ChallengeTests
//
//  Created by Gustavo Melleu on 26/08/25.
//

import Testing
import Combine
@testable import App_Challenge

@MainActor
struct OrderViewModelTests {

    @Test
    func init_default_isEmpty() {
        let vm = OrderViewModel()
        #expect(vm.products.isEmpty)
    }

    @Test
    func init_withProducts_setsProducts() {
        let p1 = Product(id: 1, title: "A", description: "", category: "", price: 10, thumbnail: "")
        let p2 = Product(id: 2, title: "B", description: "", category: "", price: 20, thumbnail: "")

        let vm = OrderViewModel(products: [p1, p2])
        #expect(vm.products.map(\.id) == [1, 2])
    }

    @Test
    func changingProducts_publishesObjectWillChange() async {
        let vm = OrderViewModel()
        var cancellables: Set<AnyCancellable> = []

        var published = false
        vm.objectWillChange
            .sink { _ in published = true }
            .store(in: &cancellables)

        vm.products = [Product(id: 99, title: "X", description: "", category: "", price: 1, thumbnail: "")]
        // dá uma rodada no runloop para o publisher emitir
        await Task.yield()

        #expect(published)
        _ = cancellables // mantêm vivos
    }
}
