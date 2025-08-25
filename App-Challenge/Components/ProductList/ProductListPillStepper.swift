//
//  ProductListView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//


import SwiftUI
import SwiftData

struct ProductListPillStepper: View {
    @Environment(\.modelContext) private var ctx
    @State private var qty = 1
    var product: Product

    var body: some View {
        ZStack {
            HStack(spacing: 8) {
                AsyncImage(url: URL(string: product.thumbnail)) { $0.resizable() }
                    placeholder: { Image("ImageProduct").resizable().frame(width: 78, height: 78).padding(8) }

                VStack {
                    Text(product.title).font(.footnote).lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(String(format: "US$ %.2f", product.price)).fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }

                PillStepper(value: $qty, range: 0...9, step: 1)
                    .padding(.trailing, 16)
            }
        }
        .frame(width: 361, height: 94)
        .background(RoundedRectangle(cornerRadius: 12).foregroundStyle(.backgroundsSecondary))
        .task {
            if let item = try? CartService(ctx: ctx).find(product.id) {
                qty = max(1, item.qty)
            }
        }
        .onChange(of: qty) { newValue in
            do {
                try CartService(ctx: ctx).setQty(productId: product.id, qty: newValue)
                print("✏️ qty \(product.id) -> \(newValue)")
            } catch { print("❌ erro qty:", error) }
        }
    }
}
