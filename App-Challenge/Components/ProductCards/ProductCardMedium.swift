//
//  ProductCardMedium.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI

struct ProductCardMedium: View {
    

    @State private var showDetailsModal: Bool = false
    
    
    var product: Product
    
    var body: some View {
        
        
        
        ZStack {
               RoundedRectangle(cornerRadius: 16)
                   .foregroundStyle(.background.secondary)
                   .frame(width: 177, height: 250)
               
               VStack{
                   ZStack(alignment: .topTrailing){
//                       Image("PlaceholderMediumCard")
                       AsyncImage(url: URL(string: product.thumbnail)) { image in
                           image.resizable()
                       } placeholder: {
                           Image( "ImageProduct")
                           
                               .resizable()
                               .frame(width: 160, height: 160)
                               .cornerRadius(8)
                               .padding(.top, 8)
                       }
//                        coração independente
                       FavoriteIcon(productId: product.id)
                                          .padding(8)
//                           .padding(.top, 8)
                           .onTapGesture {
                               print("Favorito clicado")
                           }
                   }
                   Spacer()
                   
                   VStack( alignment: .leading, spacing: 8,){
                       Text(product.title)
                           .font(.subheadline)
                           .padding(.leading, 8)
                       
                       Text(String(format: "US$ %.2f", product.price))
                           .fontWeight(.bold)
                           .font(.subheadline)
                           .frame(maxWidth: .infinity, alignment: .leading)
                           .padding(.leading, 8)
                   }
                   
                   Spacer()
               }
               .frame(width: 177, height: 250)
               .contentShape(Rectangle())
               .onTapGesture {
                   showDetailsModal = true
               }
           }
           .sheet(isPresented: $showDetailsModal) {
               NavigationStack {
                   Detail(product: product)
               }
                
           }
    }
}

#Preview {
//    ProductCardMedium(
//            imageName: "PlaceholderMediumCard",
//            productName: "Product name with two or more lines goes here",
//            price: "US$ 00,00"
//        )
//    ProductCardMedium(product: )
}
