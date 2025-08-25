//
//  Home.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Home: View {

    let viewModel : ProductViewModel
    
    var isPad : Bool { UIDevice.current.userInterfaceIdiom == .pad}
    
    var columnsDeals :[GridItem]{
        isPad ? [GridItem(.flexible()), GridItem(.flexible())] :
                [GridItem(.flexible())]
    }
    var columnsMedium :[GridItem]{
        isPad ? Array(repeating: GridItem(.flexible(), spacing: 16), count: 4) :
                Array(repeating: GridItem(.flexible(), spacing: 12), count: 2)
    }
    
    
    var body: some View {
        
         
         // define colunas baseado no device
        var gridColumns: [GridItem] {
             if UIDevice.current.userInterfaceIdiom == .pad {
                 
                 
                 
                 
                 return Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
             } else {
               
                 return [GridItem(.flexible()), GridItem(.flexible())]
             }
         }
        
        
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Deals of the day")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 16)
                    .padding(.top, 16)
                    .accessibilityAddTraits(.isHeader)
                
                if isPad {
                    LazyVGrid(columns: columnsDeals, spacing: 16) {
                        ForEach(viewModel.products.prefix(2)) { product in
                            ProductCardLarge(product: product, viewModel: viewModel)
                        }
                    }
                }else if
                    let product = viewModel.product {
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
                            .accessibilityElement(children: .combine)
                            .accessibilityLabel("\(product.title)")
                            .accessibilityValue("Preço: \(product.price, format: .currency(code: "BRL"))")
                            .accessibilityHint("Toque para abrir os detalhes")
                        
                        
                    }
                }
                .padding(.horizontal, 16)
                
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
}

//#Preview {
////    Home(viewModel: ProductViewModel(service: ProductService()))
//    Home()
//}
