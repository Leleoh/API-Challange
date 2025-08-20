//
//  Category.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Category: View {
    
//    let category: ProductCategory //Categoria selecionada
    @State private var searchText = ""
   
    let title: String
    let products: [Product]
    
//    let viewModel : ProductViewModel
    
    
    
    
//    let items = Array(0..<200)

    var filteredProducts: [Product] {
        if searchText.isEmpty {
            return products
        } else {
            return products.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())],
                          spacing: 12) {
                    ForEach(filteredProducts) { product in
                        ProductCardMedium(product: product)
                    }
                }
                .padding(16)
            }//Fim ScrollView
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")

            
        }//Fim navigation Stack
        .navigationTitle("Category")
        .navigationBarTitleDisplayMode(.inline)
    }
}




//#Preview {
//    
//    let listaprodutos: [Product] = []
//    
//    let mock = Category(title: "Apple", products: listaprodutos, viewModel: viewModel)
//}
