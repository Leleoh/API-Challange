////
////  CategoryView.swift
////  App-Challenge
////
////  Created by Gustavo Melleu on 13/08/25.
////
//
//import SwiftUI
//
//struct CategoryView: View {
//    var categories  = "Category"
//  
//    
//    var body: some View {
//        
//        NavigationStack{
//            HStack{
//                
//                Button{
//                    
//
//                    
//                }label: {
//                    Text(categories)
//                        .foregroundStyle(.black)
//                    Spacer()
//                    Image(systemName: "chevron.right")
//                    //                    .foregroundStyle(.fill.tertiary)
//                        .foregroundStyle(.black)
//                    
//                    
//                    
//                    
//                }
//                .padding()
//                
//                
//                
//            }
//     
//            
//        }
//       
//        
//        
//        
//    }
//}
//
//#Preview {
//    CategoryView()
//}


import SwiftUI

struct CategoryView: View {
    var categories = "Category"

    var body: some View {
        
        HStack {
            Text(categories)
                .foregroundStyle(.black)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.black)
        }
        .padding(16)
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(Color(.white))
        )
        .contentShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    CategoryView()
        .padding()
}
