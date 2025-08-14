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
            
            Tab("Tasks", systemImage: "house") {
                NavigationStack {
                    Home()
                }
            }
            
            Tab("Tasks", systemImage: "square.grid.2x2.fill") {
                NavigationStack {
                    Categories()
                }
            }
            
            Tab("Tasks", systemImage: "cart.fill") {
                NavigationStack {
                    Cart()
                }
            }
            
            Tab("Tasks", systemImage: "heart.fill") {
                NavigationStack {
                   Favorites()
                }
            }
            
            Tab("Tasks", systemImage: "bag.fill") {
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
