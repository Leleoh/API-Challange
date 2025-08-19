//
//  ProductListOrders.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI

struct ProductListOrders: View {
    
    var product: Product
    
    var body: some View {
        
        HStack(spacing : 8){
            
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Image( "ImageProduct")
                    .resizable()
                    .frame(width: 78, height: 78)
                    .padding(8)
            }
            VStack(){
                
                Text("DELIVERY BY MONTH, 00")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(product.title)
                    .font(.system(size: 13, weight: .regular))
                    .font(.footnote)
                    .lineLimit(2)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                
                Text(String(format: "US$ %.2f", product.price))
                    .font(.system(size: 17, weight: .regular))
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            
            
            
        }
        .frame(width: 361, height: 94)
  
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.backgroundsSecondary)
              
        )
        
    }
}
#Preview {
    let mock = Product(
        id: 1,
        title: "Apple iPhone 15 Pro Max 256GB",
        description: "Topzera",
        category: "smartphones",
        price: 1299.99,
        thumbnail: "https://i.dummyjson.com/data/products/1/thumbnail.jpg"
    )
    ProductListOrders(product: mock)
}
