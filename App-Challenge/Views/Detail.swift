//
//  Detail.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Detail: View {
    @Environment(\.dismiss) private var dismiss
    @State private var showSheet = false
    
    var product : Product
    
    //    var text = "Name of a product with two or more lines goes here"
    //    var text2 = "R$ 00,00"
    //    var text3 = " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lobortis nec mauris ac placerat. Cras pulvinar dolor at orci semper hendrerit. Nam elementum leo vitae quam commodo, blandit ultricies diam malesuada. Suspendisse lacinia euismod quam interdum mollis. Pellentesque a eleifend ante. Aliquam tempus ultricies velit, eget consequat m"
    
    let productImage = ProductPhotoLarge()
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                VStack(spacing : 16){
                    
                    //Chama o componente
                    AsyncImage(url: URL(string: product.thumbnail)) { image in
                        image.resizable()
                    } placeholder: {
                        Image( "ImageProduct")
                        
                        
                    }
                    .padding()
                    
                    VStack(alignment: .leading , spacing: 16){
                        
                        VStack(alignment: .leading , spacing:4){
                            
                            Text(product.title)
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(.primary)
                            Text(String(format: "US$ %.2f", product.price))
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.primary)
                            
                            Text(product.description)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.secondary)
                            
                        }
                        
                        
                        
                        
                        
                    }
                    .padding()
                    .presentationDragIndicator(.visible)
                    
                    
                }
                
                ButtonView(text : "Add to cart")
                    .padding()
                
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(Color.white, for: .navigationBar)
       
        
        
        
        
    }
    
    
    
    
    
    
}
