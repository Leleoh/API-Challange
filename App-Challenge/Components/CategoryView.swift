//
//  CategoryView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 13/08/25.
//


import SwiftUI

struct CategoryView: View {
    let title: String
    let imageName: String
    

    var body: some View {
        
        HStack {
            Text(title.categoryDisplayName())
                .foregroundStyle(.labelsPrimary)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.labelsPrimary)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.backgroundsPrimary))
        )
        .contentShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CategoryView(title: "Beauty", imageName: "sparkles")
        .padding()
}
