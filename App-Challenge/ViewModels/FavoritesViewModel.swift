//
//  FavoritesViewModel.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 19/08/25.
//
import Foundation

@MainActor
final class FavoritesViewModel: ObservableObject {
    @Published var items: [Product] = []
    @Published var isLoading = false

    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol = ProductService()) { self.service = service }

    func load(byIDs ids: [Int]) async {
        guard !ids.isEmpty else { items = []; return }
        isLoading = true
        defer { isLoading = false }

        do {
            var result: [Product] = []
            for id in ids {
                let p = try await service.fetchProduct(number: id)
                result.append(p)
            }
            // preserva ordem dos favoritos (mais recentes primeiro)
            let order = ids
            items = result.sorted { a, b in
                (order.firstIndex(of: a.id) ?? .max) < (order.firstIndex(of: b.id) ?? .max)
            }
        } catch {
            print("Erro carregar favoritos:", error)
            items = []
        }
    }
}
