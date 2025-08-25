//
//  Detail.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI
import SwiftData

struct Detail: View {
    @Environment(\.modelContext) private var ctx
    @State private var added = false
    
    var product : Product

    
//    let productImage = ProductPhotoLarge(product: )
    
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
                        .padding(.horizontal)
                        
                        
                        
                        
                        
                        
                    }
                    .padding(.bottom, 100)
                    .padding()
                    .presentationDragIndicator(.visible)
                    
                }
                
                }
            .safeAreaInset(edge: .bottom) {
                            Button(action: {
                                do {
                                    try CartService(ctx: ctx).add(productId: product.id, qty: 1)
                                    added = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { added = false }
                                    print(" Adicionado ao carrinho id=\(product.id)")
                                } catch {
                                    print(" Erro ao adicionar:", error)
                                }
                            }) {
                                Text( "Add to cart")
                                    .font(.system(.body, weight: .semibold))
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .foregroundStyle(.labelsPrimary)
                                    .background(
                                        RoundedRectangle(cornerRadius: 12)
                                            .foregroundStyle(.fillsTertiary)
                                    )
                            }
                            .padding(.horizontal)
                            .padding(.top, 8)
                            .padding(.bottom, 12)
                
            }
            
            
            
            
            
        }
        
        
        
        
        
        
        
    }
}
