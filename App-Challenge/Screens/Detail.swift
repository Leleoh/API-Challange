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
    
    var text = "Name of a product with two or more lines goes here"
    var text2 = "R$ 00,00"
    var text3 = " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed lobortis nec mauris ac placerat. Cras pulvinar dolor at orci semper hendrerit. Nam elementum leo vitae quam commodo, blandit ultricies diam malesuada. Suspendisse lacinia euismod quam interdum mollis. Pellentesque a eleifend ante. Aliquam tempus ultricies velit, eget consequat m"
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                
                VStack(spacing : 16){
                    
                    Image("Detailimage")
                    
                    VStack(alignment: .leading , spacing: 16){
                        
                        VStack(alignment: .leading , spacing:4){
                            
                            Text(text)
                                .font(.system(size: 20, weight: .regular))
                                .foregroundColor(.primary)
                            
                            Text(text2)
                                .font(.system(size: 22, weight: .bold))
                                .foregroundColor(.primary)
                            
                        }
                            
                        
                            Text(text3)
                                .font(.system(size: 17, weight: .regular))
                                .foregroundColor(.secondary)
                        
      
                    }
                    
                }
                .padding()
                
          
                
            }
            
            ButtonView(text : "Add to cart")
                .padding()
               
                }
        }
        
            
            
            
            
        }
    
    
    
    
    


#Preview {
    Detail()
}
