////
////  FavoriteIcon.swift
////  App-Challenge
////
////  Created by Leonel Ferraz Hernandez on 13/08/25.
////
//
//import SwiftUI
//
//struct FavoriteIcon: View {
//    @Environment(\.modelContext) private var ctx
//       let productId: Int
//
//    
//    @State private var isPressed: Bool = false
//    
//    var body: some View {
//        
//        ZStack{
//            RoundedRectangle(cornerRadius: 8)
//                .frame(width: 38, height: 38)
//                .foregroundStyle(.fill.tertiary)
//            
//            Button(action:{
//                isPressed.toggle()
//            }){
//                Image(systemName: isPressed ? "heart.fill" : "heart")
//                    .foregroundStyle(.labelsPrimary)
//                
//            }
//        }
//        
//    }
//}
//
//#Preview {
//    FavoriteIcon()
//}

// FavoriteIcon.swift
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

            Button { toggle() } label: {
                Image(systemName: isFav ? "heart.fill" : "heart")
                    .foregroundStyle(.labelsPrimary)
            }
        }
        .task { isFav = (try? isFavorite(productId)) ?? false }
    }

    private func toggle() {
        do {
            if try isFavorite(productId) {
                try remove(productId)
                isFav = false
            } else {
                ctx.insert(SavedProductRef(productId: productId, isFavorite: true))
                try ctx.save()
                isFav = true
            }
        } catch { print("Fav toggle erro:", error) }
    }

    private func isFavorite(_ id: Int) throws -> Bool {
        let d = FetchDescriptor<SavedProductRef>(
            predicate: #Predicate { $0.productId == id && $0.isFavorite == true }
        )
        return try ctx.fetchCount(d) > 0
    }

    private func remove(_ id: Int) throws {
        let d = FetchDescriptor<SavedProductRef>(
            predicate: #Predicate { $0.productId == id && $0.isFavorite == true }
        )
        try ctx.fetch(d).forEach { ctx.delete($0) }
        try ctx.save()
    }
}
