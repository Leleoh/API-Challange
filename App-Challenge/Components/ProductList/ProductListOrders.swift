//
//  ProductListOrders.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 18/08/25.
//

import SwiftUI

struct ProductListOrders: View {
    var product: Product
    var date: Date   // <-- adicionado

    // formatter estático p/ não recriar toda hora
    private static let df: DateFormatter = {
        let df = DateFormatter()
        df.dateStyle = .medium      // ex.: Aug 20, 2025
        df.timeStyle = .none
        // se quiser pt-BR:
        // df.locale = Locale(identifier: "pt_BR")
        // df.setLocalizedDateFormatFromTemplate("dd MMM yyyy")
        return df
    }()

    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: product.thumbnail)) { image in
                image.resizable()
            } placeholder: {
                Image("ImageProduct")
                    .resizable()
                    .frame(width: 78, height: 78)
                    .padding(8)
            }
            Spacer()

            VStack(alignment: .leading, spacing: 4) {
                Text("DELIVERY BY \(Self.df.string(from: date))")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundColor(.secondary)

                Text(product.title)
                    .font(.system(size: 13, weight: .regular))
                    .lineLimit(2)

                Text(String(format: "US$ %.2f", product.price))
                    .font(.system(size: 17, weight: .bold))
            }
            Spacer()
        }

        
        .frame(width: 361, height: 94)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.backgroundsSecondary)
        )
    }
}
