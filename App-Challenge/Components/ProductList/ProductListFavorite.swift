//
//  ProductListFavorite.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI
struct ProductListFavorite: View {
    
    
    
    var product: Product

//    let viewModel : ProductViewModel
    
    var body: some View {
        
       
            
        ZStack{
            
            HStack(spacing : 8){
                AsyncImage(url: URL(string: product.thumbnail)) { $0.resizable()
                    .frame(maxWidth: 78, maxHeight: 78).padding(8)}
                    placeholder: { Image("ImageProduct").resizable().frame(width: 78, height: 78).padding(8) }
                    .accessibilityHidden(true)
                VStack{
                    
                    Text(product.title)
                        .font(.footnote)
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Text(String(format: "US$ %.2f", product.price))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                       
                    
                }
               
        
                    CartIcon(product: product)
                    .accessibilityHidden(true)
                    
                    .padding(.trailing, 16)
                    
    
                    
                }
                
                
                
                
            }
    
            .frame(width: 361, height: 94)
        
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .foregroundStyle(.backgroundsSecondary)
                
            )
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text("\(product.title). Preço US$ \(String(format: "%.2f", product.price))"))
        
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
    
    ProductListFavorite(product:mock)
}
