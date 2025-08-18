//
//  FavoritesEmptyState.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct FavoritesEmptyState: View {
    var body: some View {
      
        VStack(spacing: 8) {
            
            Image(systemName: "heart.slash")
                .resizable()
                .frame(width: 69, height: 65)
                .foregroundStyle(.graysGray2)
            
            
            VStack(spacing: 16) {
                Text("No favorites yet!")
                    .font(.system(.body, weight: .semibold))
                    .foregroundStyle(.labelsPrimary)
                
                Text("Favorite an item and it will show up here.")
                    .foregroundStyle(.labelsSecondary)
            }
            
        }
    
        
        
        
        
        
        
    }
}

#Preview {
    FavoritesEmptyState()
}
