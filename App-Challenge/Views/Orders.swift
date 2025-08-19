//
//  Orders.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI

struct Orders: View {
    @State private var searchText = ""
    var body: some View {
       
        VStack{
            
            OrdersEmptyState()
        }
        
        .searchable(text: $searchText, prompt: "Search")
        
        
    }
}

#Preview {
    Orders()
}
