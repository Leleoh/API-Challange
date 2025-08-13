//
//  CategoryButtonView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 13/08/25.
//

import SwiftUI

struct CategoryButtonView: View {
     var category: String = "Category"
    
    var body: some View {
      
      
        NavigationStack{
            
            VStack{
                
                Button{
                    
                    
                    
                } label : {
                    Image(systemName: "sparkles")
                        .foregroundStyle(.fill.quaternary)
                        .font(.system(size: 40))
                        .frame(width: 84, height: 84)
                        .background(
                            RoundedRectangle(cornerRadius:16)

                                .foregroundStyle(.background.secondary)
                        )
                    
                    
                }
                Text(category)
                
                
            }
                   
            
            
            
        }
        
        
        
        
    }
 
}

#Preview {
    CategoryButtonView()
}
