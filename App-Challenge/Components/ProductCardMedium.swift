//
//  ProductCardMedium.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI

struct ProductCardMedium: View {
    var body: some View {
        
        
        
        ZStack {
            
            Color.blue.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.background.secondary)
                .frame(width: 177, height: 250)
            
            VStack{
                Image("PlaceholderMediumCard")
                    .resizable()
                    .frame(width: 161, height: 160)
                    .cornerRadius(16)
                    .padding(.top, 8)
                Spacer()
            }
            .frame(width: 177, height: 250)
            
        }
        
    }
}

#Preview {
    ProductCardMedium()
}
