//
//  CategoryButtonView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 13/08/25.
//

// CategoryButtonView.swift

import SwiftUI

struct CategoryButtonView: View {
    let categoryName: String
    let systemImageName: String
    
    var body: some View {
        VStack {
            NavigationLink(destination: Text("\(categoryName.categoryDisplayName()) Category")) {
                Image(systemName: systemImageName)
                    .foregroundStyle(.fillsQuaternary)
                    .font(.system(size: 40))
                    .frame(width: 84, height: 84)
                    .background(
                        RoundedRectangle(cornerRadius:16)
                            .foregroundStyle(.backgroundsSecondary)
                    )
            }
            Text(categoryName.categoryDisplayName())
                .font(.footnote)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    CategoryButtonView(categoryName: "Beauty", systemImageName: "sparkles")
}
