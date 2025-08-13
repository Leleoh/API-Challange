//
//  FavoriteIcon.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI

struct FavoriteIcon: View {
    
    @State private var isPressed: Bool = false
    
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 38, height: 38)
                .foregroundStyle(.fill.tertiary)
            
            Button(action:{
                isPressed.toggle()
            }){
                Image(systemName: isPressed ? "heart.fill" : "heart")
                    .foregroundStyle(.labelsPrimary)
                
            }
        }
        
    }
}

#Preview {
    FavoriteIcon()
}
