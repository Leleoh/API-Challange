////////
////////  Categories.swift
////////  App-Challenge
////////
////////  Created by Gustavo Melleu on 13/08/25.
////////
//////
//
//import SwiftUI
//
//struct Categories: View {
//    @State var searchText = ""
//    
//    let items = Array(0..<20)
//    
//    var body: some View {
//        NavigationStack {
//            ScrollView(.vertical, showsIndicators: false) {
//                VStack(spacing: 16) {
//                    
//                    // 1) Carrossel horizontal logo abaixo da search bar
//                    ScrollView(.horizontal, showsIndicators: false) {
//                        HStack(spacing: 12) {
//                            ForEach(0..<10, id: \.self) { _ in
//                                CategoryButtonView()
//                            }
//                        }
//                        .padding(.horizontal, 16)
//                        .padding(.vertical, 8)
//                    }
//                    
//                    // 2) Lista/grid de categorias imediatamente abaixo
//                    
//                       VStack ( spacing: 12) {
//                        ForEach(items, id: \.self) { _ in
//                            NavigationLink {
//                                  Category()
//                              } label: {
//                                  CategoryView()
//                              }
//                              
//                          }
//                      }
//                    
//                              .padding(.horizontal, 16)
//                              .padding(.bottom, 24)
//                }
//            }
//            .navigationTitle("Categories")
//                    
//        }
//        .searchable(text: $searchText, prompt: "Search")
//        .background(Color.white)
//    }
//}
//    #Preview {
//        Categories()
//    }


import SwiftUI

struct Categories: View {
    @State var searchText = ""
    let items = Array(0..<20)
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 16) {
                    carouselSection
                    categoriesSection
                }
            }
            .navigationTitle("Categories")
        }
        .searchable(text: $searchText, prompt: "Search")
//        .background(Color.white)
    }
    
    private var carouselSection: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                ForEach(0..<4, id: \.self) { _ in
                    CategoryButtonView()
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
    private var categoriesSection: some View {
        VStack(spacing: 12) {
            ForEach(items, id: \.self) { _ in
                NavigationLink {
                    Category(viewModel: ProductViewModel(service: ProductService()))
                } label: {
                    CategoryView()
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
        .searchable(text: $searchText, prompt: "Search")
    }

}

#Preview {
    Categories()
}
