//
//  ButtonView.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 14/08/25.
//

import SwiftUI


struct ButtonView: View {
    var text: String = ""
    
    var body: some View {
        
        Button {
            //
        } label: {
            Text(text)
                .font(.system(.body, weight: .semibold))
                .foregroundStyle(.black)
                .padding(.vertical, 14)
                .frame(maxWidth: .infinity)
                .background(
                    RoundedRectangle(cornerRadius: 12)
                        .foregroundStyle(.fillsTertiary)
                )
            
        }
    }
}

#Preview {
    ButtonView()
}
