//
//  Favorites.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

// Favorites.swift
import SwiftUI
import SwiftData

struct Favorites: View {
    init() {}

    @State private var searchText = ""
    @StateObject private var vm = FavoritesViewModel(service: ProductService())


    @Query(filter: #Predicate<SavedProductRef> { $0.isFavorite == true })
    private var favRefs: [SavedProductRef]

    var body: some View {
       
        let orderedRefs = favRefs.sorted { $0.savedAt > $1.savedAt }
        let ids = orderedRefs.map { $0.productId }

        let filtered = vm.items.filter {
            guard !searchText.isEmpty else { return true }
            return $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.category.localizedCaseInsensitiveContains(searchText)
        }

        Group {
           if filtered.isEmpty {
               FavoritesEmptyState()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filtered, id: \.id) { p in
                            ProductListFavorite(product: p)
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                }
            }
        }
        .navigationTitle("Favorites")
        .searchable(text: $searchText, prompt: "Search")
        .task(id: ids) { await vm.load(byIDs: ids) }
    }
}
