//
//  CartIcon.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI

struct CartIcon: View {
    var product : Product
    @State private var showDetailsModal: Bool = false
    var body: some View {
        
        ZStack {
            Button{
                
                showDetailsModal = true
                
                
                
                
            }label : {
                Image(systemName: "cart.fill")
                    .foregroundStyle(.labelsPrimary)
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundStyle(.fillsTertiary)
                            .frame(width: 38, height: 38)
                        
                    )
                
                
            }
            
        }
        .sheet(isPresented: $showDetailsModal) {
            NavigationStack{
                Detail(product: product) // <- passa o product aqui
                
            }
            
        }
        
    }
}
//
//#Preview {
//    CartIcon()
//}
