//
//  ProductPhotoLarge.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 14/08/25.
//

import SwiftUI

struct ProductPhotoLarge: View {
    var product : Product
   
   
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.backgroundsSecondary)
                .frame(width: 361, height: 361)
            
            VStack {
                ZStack(alignment: .topTrailing) {
                    Image("PlaceholderMediumCard")
                        .resizable()
                        .frame(width: 329, height: 329)
                        .cornerRadius(8)
                        
                    FavoriteIcon(productId: product.id)
                                       .padding(8)
                }
            }
        }
    }
}
//
//#Preview {
//    ProductPhotoLarge()
//}
