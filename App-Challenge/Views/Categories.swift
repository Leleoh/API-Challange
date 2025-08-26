//
//  Categories.swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 13/08/25.
//
import SwiftUI

struct Categories: View {
    
    @StateObject private var viewModel = CategoriesViewModel()
    @State private var selectedCategory: String? = nil
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
        .background(Color.backgroundsPrimary)
        .task {
            await viewModel.loadProducts()
        }
    }
    
    private var carouselSection: some View {
        // Adicionamos uma ScrollView para o caso de ter mais botões no futuro
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 12) {
                //  Passamos o nome da categoria e o binding para cada botão
                CategoryButtonView(
                    categoryName: "beauty",
                    systemImageName: "sparkles",
                    
                )
                .accessibilityLabel(NSLocalizedString("Beauty", comment: "Category name"))
                .accessibilityHint(NSLocalizedString("Opens the beauty category", comment: "Hint for category button"))
                
                CategoryButtonView(
                    categoryName: "fragrances",
                    systemImageName: "drop.fill",
                )
                .accessibilityLabel(NSLocalizedString("Fragances", comment: "Category name"))
                .accessibilityHint(NSLocalizedString("Opens the fragrance category", comment: "Hint for category button"))
                
                CategoryButtonView(
                    categoryName: "furniture",
                    systemImageName: "chair.lounge.fill",
                )
                .accessibilityLabel(NSLocalizedString("Furniture", comment: "Category name"))
                .accessibilityHint(NSLocalizedString("Opens the furniture category", comment: "Hint for category button"))
                
                
                CategoryButtonView(
                    categoryName: "groceries",
                    systemImageName: "basket.fill",
                )
                .accessibilityLabel(NSLocalizedString("Groceries", comment: "Category name"))
                .accessibilityHint(NSLocalizedString("Opens the grocies category", comment: "Hint for category button"))
            }
            .padding(.horizontal, 16)
        }
    }
    
    private var categoriesSection: some View {
        VStack(spacing: 8) {
            ForEach(viewModel.categories, id: \.self) { categoryName in
                NavigationLink {
                    Category(
                        title: categoryName,
                        products: viewModel.allProducts.filter { $0.category.lowercased() == categoryName.lowercased() }
                    )
                } label: {
                    CategoryView(title: categoryName.formattedForDisplay, imageName: "sparkles") // ou mapa de ícones se quiser
                }
                Divider()
            }
        }
        .padding(.horizontal, 8)
    }

}

#Preview {
    Categories()
}

extension String {
    var formattedForDisplay: String {
        self
            .replacingOccurrences(of: "-", with: " ") // substitui hífen por espaço
            .split(separator: " ")                     // divide em palavras
            .map { $0.capitalized }                   // primeira letra maiúscula
            .joined(separator: " ")                    // junta de volta
    }
}
