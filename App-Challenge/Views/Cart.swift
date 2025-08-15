//
//  Cart.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Cart: View {
    @State private var searchText = ""
    var body: some View {
       
       
        VStack{
            
            CartEmptyState()
            
        }
        .searchable(text: $searchText, prompt: "Search")
        
        
    }
}

#Preview {
    Cart()
}
