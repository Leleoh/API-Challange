//
//  Home.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Home: View {
    
    
    
    let viewModel : ProductViewModel
    
    var body: some View {
        
        
        ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Deals of the day")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                        
                        
                        if let product = viewModel.product {
                            ProductCardLarge(product: product, viewModel: viewModel)
                                .padding(.horizontal, 16)
                        }

                        Text("Top picks")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ForEach(viewModel.products) { product in
                                ProductCardMedium(product: product)
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    }
                    .task {
                        await viewModel.loadProducts()
                    }
                }
        .navigationTitle("Home")
        .toolbarBackground(Color(UIColor.tertiarySystemBackground), for: .navigationBar)
        .toolbarVisibility(.visible, for: .navigationBar)
        .refreshable {
            await viewModel.loadProducts()
        }
        
        
        
    }
}

//#Preview {
////    Home(viewModel: ProductViewModel(service: ProductService()))
//    Home()
//}
