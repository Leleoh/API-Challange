//
//  ProductCardLarge.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 14/08/25.
//

import SwiftUI

struct ProductCardLarge: View {
    //    let imageName: String
    //    let productName: String
    //    let price: String
    let heart = FavoriteIcon()
    
    @State private var showDetailsModal: Bool = false
    
    var body: some View {
        
       
        
        ZStack{
            
//            Color.blue.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.background.secondary)
                .frame(width: 361, height: 176)
            
            HStack(){
                Image("PlaceholderMediumCard")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(8)
                    .padding(.leading, 8)
                
                VStack{
                    HStack(alignment: .center){
                        Text("CATEGORY")
                            .font(.footnote)
                            .foregroundStyle(.labelsSecondary)
                        
                        Spacer()
                        
                        heart
                    }
                    
                    Spacer()
                    
                    Text("Product name with two or more lines goes here")
                        .font(.subheadline)
                    
                    Text("US$ 00,00")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 2)
                    
                    Spacer()
                }
                .padding(.top, 8)
                
                Spacer()
                
            }
            .frame(width: 361, height: 176)
            .contentShape(Rectangle())
            .onTapGesture {
                showDetailsModal = true
            }
            .sheet(isPresented: $showDetailsModal) {
                Detail()
            }
            
        }//Fim zstack
        
        
        
    }
}

#Preview {
    //    ProductCardLarge(
    //            imageName: "PlaceholderMediumCard",
    //            productName: "Product name with two or more lines goes here",
    //            price: "US$ 00,00"
    //        )
    ProductCardLarge()
}
