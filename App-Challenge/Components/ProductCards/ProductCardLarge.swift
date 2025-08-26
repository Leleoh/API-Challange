////
////  ProductCardLarge.swift
////  App-Challenge
////
////  Created by Leonel Ferraz Hernandez on 14/08/25.
////
//
import SwiftUI

struct ProductCardLarge: View {
    
    var product: Product
    
    @State private var showDetailsModal: Bool = false
    
    let viewModel : ProductViewModel
    
    var body: some View {
        
       
        
        ZStack{
            
//            Color.blue.ignoresSafeArea()
            
            RoundedRectangle(cornerRadius: 16)
                .foregroundStyle(.background.secondary)
                .frame(width: 361, height: 176)
            
            HStack(){
//                Image("PlaceholderMediumCard")
                AsyncImage(url: URL(string: product.thumbnail)) { image in
                    image.resizable()
                } placeholder: {
                    Image( "ImageProduct")
                    
                        .resizable()
                        .frame(width: 160, height: 160)
                        .cornerRadius(8)
                        .padding(.leading, 8)
                }
                
                VStack{
                    HStack(alignment: .center){
                        Text(product.category)
                            .font(.footnote)
                            .textCase(.uppercase)
                            .foregroundStyle(.labelsSecondary)
                        
                        Spacer()
                        
                        FavoriteIcon(productId: product.id)
                                           .padding(8)
                    }
                    
                    Spacer()
                    
                    Text(product.title)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                    
                    Text(String(format: "US$ %.2f", product.price))
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
            NavigationStack{
                    Detail(product: product) // <- passa o product aqui
                    
                }
                
            }
//            .navigationTitle("Details")// título centralizado
//            .navigationBarTitleDisplayMode(.inline)
//                Detail(product : product)
                
            
            
        }//Fim zstack
        
        
        
    }
}

////#Preview {
////    //    ProductCardLarge(
////    //            imageName: "PlaceholderMediumCard",
////    //            productName: "Product name with two or more lines goes here",
////    //            price: "US$ 00,00"
////    //        )
////    ProductCardLarge()
////}



