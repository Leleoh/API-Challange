//
//  FavoriteIcon.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.

import SwiftUI
import SwiftData

import SwiftUI
import SwiftData

struct FavoriteIcon: View {
    @Environment(\.modelContext) private var ctx
    let productId: Int
    @State private var isFav = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .frame(width: 38, height: 38)
                .foregroundStyle(.fill.tertiary)

            Button {
                toggle()
            } label: {
                Image(systemName: isFav ? "heart.fill" : "heart")
                    .foregroundStyle(.labelsPrimary)
            }
        }
        .task {
            let service = FavoriteIconService(ctx: ctx)
            isFav = (try? service.isFavorite(productId)) ?? false
        }
    }
    
    private func toggle() {
        let service = FavoriteIconService(ctx: ctx)
        do {
            if try service.isFavorite(productId) {
                try service.removeFavorite(productId)
                isFav = false
            } else {
                try service.addFavorite(productId)
                isFav = true
            }
        } catch {
            print("Fav toggle erro:", error)
        }
    }
}
