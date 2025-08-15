//
//  Category.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Category: View {
    @State private var searchText = ""
    let items = Array(0..<20)

    let viewModel: ProductViewModel
    
    var body: some View {
        NavigationStack {
            List {
                    

                // Seção 2: grid/lista de categorias
                Section {
                    LazyVGrid(columns: [GridItem(.flexible()),
                                        GridItem(.flexible())],
                              spacing: 12) {
                        ForEach(viewModel.products) { product in
                            ProductCardMedium(product: product)
                        }
                    }
                    .padding(.vertical, 8)
                    .listRowInsets(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 16))
                }
            }
            .listStyle(.plain)
            .navigationTitle("Categories")
        }
        .searchable(text: $searchText, prompt: "Search")
    }
}
#Preview {
    Category(viewModel: ProductViewModel(service: ProductService()))
}
