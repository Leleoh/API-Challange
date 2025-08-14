//
//  Home.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Home: View {
    
    let LargeCard = ProductCardLarge()
    var body: some View {
        
        
        ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        
                        Text("Deals of the day")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                            .padding(.top, 16)
                        
                        LargeCard
                            .padding(.horizontal, 16)
                        
                        Text("Top picks")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal, 16)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 12) {
                            ForEach(0..<20) { index in
                                ProductCardMedium()
                            }
                        }
                        .padding(.horizontal, 16)
                        
                    }
                }
        .navigationTitle("Home")
        .toolbarBackground(Color(UIColor.tertiarySystemBackground), for: .navigationBar)
        .toolbarVisibility(.visible, for: .navigationBar)
        
        
        
    }
}

#Preview {
    Home()
}
