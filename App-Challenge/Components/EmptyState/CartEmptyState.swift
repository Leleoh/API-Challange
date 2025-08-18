//
//  EmptyState.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct CartEmptyState: View {
    var body: some View {
       
        
       
            VStack(spacing: 8) {
                
                Image(systemName: "cart.badge.questionmark")
                    .resizable()
                    .frame(width: 92, height: 72)
                    .foregroundStyle(.graysGray2)
                
                
                VStack(spacing: 16) {
                    Text("Your cart is empty!")
                        .font(.system(.body, weight: .semibold))
                        .foregroundStyle(.labelsPrimary)
                    
                    Text("Add an item to your cart.")
                        .foregroundStyle(.labelsSecondary)
                }
                
            }
        
        
        
        
    }
}

#Preview {
    CartEmptyState()
}
