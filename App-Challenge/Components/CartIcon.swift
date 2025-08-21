//
//  CartIcon.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI

struct CartIcon: View {
    var body: some View {
      
     ZStack {
         Button{
             
             
             
             
         }label : {
             Image(systemName: "cart.fill")
                 .foregroundStyle(.labelsPrimary)
                 .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.fillsTertiary)
                        .frame(width: 38, height: 38)
                    
                 )
              
             
         }
            
        }
        
    }
}

#Preview {
    CartIcon()
}
