//
//  ContentView.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
      
        TabView{
            
            Tab("Home", systemImage: "house") {
                NavigationStack {
//                    Home(viewModel: ProductViewModel(service: ProductService()))
                    Home()
                }
            }
            
            Tab("Categories", systemImage: "square.grid.2x2.fill") {
                NavigationStack {
                    Categories()
                }
            }
            
            Tab("Cart", systemImage: "cart.fill") {
                NavigationStack {
                    Cart()
                }
            }
            
            Tab("Favorites", systemImage: "heart.fill") {
                NavigationStack {
                   Favorites()
                }
            }
            
            Tab("Orders", systemImage: "bag.fill") {
                NavigationStack {
                    Orders()
                }
            }
            
            
            
            
            
            
        }
        
        
        
    }
}

#Preview {
    TabBar()
}
