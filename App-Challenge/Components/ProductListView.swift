//
//  ProductListView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct ProductListView: View {
    var text : String = "Product name with two or more lines goes here"
    var text1 : String = "US$ 00,00"
    @State private var qty = 1
    
    var body: some View {
       
        
        ZStack{
            
            HStack(spacing : 8){
                Image("ImageProduct")
                    .resizable()
                    .frame(width: 78, height: 78)
                    .padding(8)

                VStack{
                    
                    Text(text)
                        .font(.footnote)
                        .lineLimit(2)
                      
                    
                    
                    Text(text1)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
               
                
                
                
                PillStepper(value: $qty, range: 1...100, step: 1)

                    .padding(.trailing,16)
              
                
                
                   
                
                           
                
             
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
    ProductListView()
}
