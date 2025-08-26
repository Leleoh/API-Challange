//
//  PillStepper.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//


import SwiftUI



struct PillStepper: View {
    @Binding var value: Int
    var range: ClosedRange<Int> = 0...99
    var step: Int = 1

    var body: some View {
        HStack(spacing: 8) {
          
            Button {
                value = max(range.lowerBound, value - step)
            } label: {
                Image(systemName: "minus")
                    .font(.system(size: 15, weight: .regular))
                    .frame(width: 23, height: 23)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .buttonStyle(.plain)
            .opacity(value <= range.lowerBound ? 0.4 : 1)

          
            Text("\(value)")
                .font(.system(size: 17, weight: .regular))
                .frame(width: 20)

           
            Button {
                value = min(range.upperBound, value + step)
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 15, weight: .regular))
                    .frame(width: 23, height: 23)
                    .background(Color(.systemGray5))
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
            }
            .buttonStyle(.plain)
            .opacity(value >= range.upperBound ? 0.4 : 1)
        }
    }
}


