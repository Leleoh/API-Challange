//import Foundation
//import Testing
//@testable import App_Challenge
//
//struct MockCartServiceTests {
//
//    @Test
//    func remove_deletesItem() throws {
//        let mock = MockCartService()
//        mock.seed([CartItem(productId: 1, qty: 1), CartItem(productId: 2, qty: 2)])
//        try mock.remove(productId: 1)
//        #expect(mock.cartItems.map(\.productId) == [2])
//    }
//
//    @Test
//    func shouldFail_blocksOperations() {
//        let mock = MockCartService()
//        mock.shouldFail = true
//
//    
//        #expect(throws: NSError.self) { try mock.add(productId: 1) }
//        #expect(throws: NSError.self) { _ = try mock.find(1) }
//        #expect(mock.cartItems.isEmpty)
//    }
//
//    @Test
//    func failOn_specificMethods() {
//        let mock = MockCartService()
//        mock.failOn = ["add"]
//
//        #expect(throws: NSError.self) { try mock.add(productId: 1) }
//
//        
//        mock.seed([CartItem(productId: 2, qty: 0)])
//
//    
//        #expect(throws: Never.self) {
//            try mock.setQty(productId: 2, qty: 3)
//        }
//
//        
//        #expect( (try? mock.find(2))?.qty == 3 )
//    }
//}

import Testing
@testable import App_Challenge


@MainActor
struct CartViewModelTests {

    private func makeVM(_ s: MockProductService) -> CartViewModel {
        CartViewModel(service: s)
    }

    @Test
    func emptyIDs_setsEmpty_andDoesNotCallService() async {
        let s = MockProductService()
        let vm = makeVM(s)

        await vm.reload(byIDs: [])

        #expect(vm.products.isEmpty)
        #expect(s.calledIDs.isEmpty)
    }

    @Test
    func loadsAll_inTheSameOrder() async {
        let s = MockProductService()
        s.seed([
            Product(id: 10, title: "A", description: "", category: "", price: 1, thumbnail: ""),
            Product(id: 5,  title: "B", description: "", category: "", price: 2, thumbnail: ""),
            Product(id: 7,  title: "C", description: "", category: "", price: 3, thumbnail: "")
        ])
        let vm = makeVM(s)

        await vm.reload(byIDs: [5, 10, 7])

        #expect(vm.products.map(\.id) == [5, 10, 7])
        #expect(s.calledIDs == [5, 10, 7])
        #expect(vm.products.count == 3)
    }

    @Test
    func duplicates_arePreserved_currentBehavior() async {
        // Se amanhã decidir deduplicar, mude o teste.
        let s = MockProductService()
        s.seed([Product(id: 1, title: "P1", description: "", category: "", price: 1, thumbnail: "")])
        let vm = makeVM(s)

        await vm.reload(byIDs: [1, 1])

        #expect(vm.products.map(\.id) == [1, 1])
        #expect(s.calledIDs == [1, 1])
    }

    @Test
    func anyFetchFailure_clearsProducts() async {
        let s = MockProductService()
        s.seed([
            Product(id: 2, title: "ok", description: "", category: "", price: 1, thumbnail: ""),
            Product(id: 3, title: "ok", description: "", category: "", price: 1, thumbnail: "")
        ])
        s.failOnIDs = [3]

        let vm = makeVM(s)
        await vm.reload(byIDs: [2, 3])

        #expect(vm.products.isEmpty)
        #expect(s.calledIDs == [2])   // só registrou o 2; o 3 falhou antes de logar
    }
}
