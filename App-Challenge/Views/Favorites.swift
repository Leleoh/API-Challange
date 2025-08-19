//
//  Favorites.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//
//
//import SwiftUI
//
//struct Favorites: View {
//    
////    let viewModel : ProductViewModel
//    @State private var searchText = ""
//    var products : [Product] = []
//    var body: some View {
//        
//        VStack{
//            
//          
//
////            ProductListFavorite(p)// << AQUI: passa um Product
//        }
//       
//        
//        
//
//        
//        .searchable(text: $searchText, prompt: "Search")
//    }
//}
//
////#Preview {
////    Favorites()
////}
///
///import SwiftUI
///
///

// Favorites.swift
import SwiftUI
import SwiftData

struct Favorites: View {
    init() {}  // <- habilita chamar Favorites() no TabBar/Navigation

    @State private var searchText = ""
    @StateObject private var vm = FavoritesViewModel(service: ProductService())

    // predicate sem enum, usando Bool
    @Query(filter: #Predicate<SavedProductRef> { $0.isFavorite == true })
    private var favRefs: [SavedProductRef]

    var body: some View {
        // ordena em memória (mais recentes primeiro)
        let orderedRefs = favRefs.sorted { $0.savedAt > $1.savedAt }
        let ids = orderedRefs.map { $0.productId }

        let filtered = vm.items.filter {
            guard !searchText.isEmpty else { return true }
            return $0.title.localizedCaseInsensitiveContains(searchText)
                || $0.category.localizedCaseInsensitiveContains(searchText)
        }

        Group {
            if vm.isLoading {
                ProgressView("Carregando favoritos…")
            } else if filtered.isEmpty {
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
