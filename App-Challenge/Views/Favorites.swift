//
//  Favorites.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Favorites: View {
    @State private var searchText = ""
    var body: some View {
        
        VStack{
            
            FavoritesEmptyState()
        }
        
        .searchable(text: $searchText, prompt: "Search")
    }
}

#Preview {
    Favorites()
}
