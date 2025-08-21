//
//  OrdersEmptyState.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI

struct OrdersEmptyState: View {
    var body: some View {
        VStack(spacing: 8) {
            
            Image(systemName: "bag.badge.questionmark")
                .resizable()
                .frame(width: 69, height: 65)
                .foregroundStyle(.graysGray2)
            
            
            VStack(spacing: 16) {
                Text("No orders yet!")
                    .font(.system(.body, weight: .semibold))
                    .foregroundStyle(.labelsPrimary)
                
                Text("Buy an item and it will show up here.")
                    .foregroundStyle(.labelsSecondary)
            }
            
        }
    }
}

#Preview {
    OrdersEmptyState()
}
