//
//  ProductCardMedium.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI

struct ProductCardMedium: View {
    
//    let imageName: String
//    let productName: String
//    let price: String
    
    let heart = FavoriteIcon()
    
    var body: some View {
        
        
        
        ZStack {
            
//            Color.blue.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.background.secondary)
                .frame(width: 177, height: 250)
            
            VStack{
                
                ZStack(alignment: .topTrailing){
                    Image("PlaceholderMediumCard")
                        .resizable()
                        .frame(width: 160, height: 160)
                        .cornerRadius(8)
                        .padding(.top, 8)
                    
                    
                    heart
                        .padding(.top, 8)
                }
                Spacer()
                
                VStack(spacing: 8){
                    Text("Product name with two or more lines goes here")
                        .font(.subheadline)
                        .padding(.horizontal, 8)
                    
                    Text("US$ 00,00")
                        .fontWeight(.bold)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                }
            
                
                Spacer()
            }
            .frame(width: 177, height: 250)
            
        }
        
    }
}

#Preview {
//    ProductCardMedium(
//            imageName: "PlaceholderMediumCard",
//            productName: "Product name with two or more lines goes here",
//            price: "US$ 00,00"
//        )
    ProductCardMedium()
}
