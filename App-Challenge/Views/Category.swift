//
//  Category.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Category: View {
    
    @State private var searchText = ""
   
    let title: String
    let products: [Product]
    


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
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search")

            
        }
        .navigationTitle(title.formattedForDisplay.categoryDisplayName())
        .navigationBarTitleDisplayMode(.inline)
    }
}



