////
////  Cart.swift
////  App-Challenge
////
////  Created by Gustavo Melleu on 14/08/25.
////
//
//import SwiftUI
//
//struct Cart: View {
//    @State private var searchText = ""
//    var body: some View {
//       
//       
//        VStack{
//            
//            CartEmptyState()
//            
//        }
//        .searchable(text: $searchText, prompt: "Search")
//        
//        
//    }
//}
//
//#Preview {
//    Cart()
//}

import Foundation
import SwiftUI
import SwiftData

@MainActor
final class CartViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var loading = false
    private let service: ProductServiceProtocol
    init(service: ProductServiceProtocol = ProductService()) { self.service = service }

    func reload(byIDs ids: [Int]) async {
        guard !ids.isEmpty else { products = []; return }
        loading = true; defer { loading = false }
        do {
            var tmp: [Product] = []
            for id in ids {
                // se seu service for number:, troque aqui:
                let p = try await service.fetchProduct(number: id)
                tmp.append(p)
            }
            // mantém ordem de adição
            let order = ids
            products = tmp.sorted {
                (order.firstIndex(of: $0.id) ?? .max) < (order.firstIndex(of: $1.id) ?? .max)
            }
            print("🛒 carregados \(products.count) produtos")
        } catch {
            print("❌ erro ao carregar cart:", error)
            products = []
        }
    }
}

struct Cart: View {
    @StateObject private var cartviewmodel = CartViewModel()

    // observa TUDO de CartItem; ordenamos em memória
    @Query private var cartItems: [CartItem]

    @State private var search = ""
    @State private var navigateToOrder = false
    
    var total: Double {
            cartItems.reduce(0) { partial, item in
                if let product = cartviewmodel.products.first(where: { $0.id == item.productId }) {
                    return partial + (product.price * Double(item.qty))
                }
                return partial
            }
        }

    var body: some View {
        let ordered = cartItems.sorted { $0.addedAt > $1.addedAt }
        let ids = ordered.map { $0.productId }

        let filtered = cartviewmodel.products.filter {
            search.isEmpty ? true :
            $0.title.localizedCaseInsensitiveContains(search) ||
            $0.category.localizedCaseInsensitiveContains(search)
        }

        VStack{
            Group {
                if cartviewmodel.loading {
                    ProgressView("Carregando carrinho…")
                } else if filtered.isEmpty {
                    CartEmptyState()
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(filtered, id: \.id) { p in
                                ProductListPillStepper(product: p)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                    }
                    .safeAreaInset(edge: .bottom) {
                        VStack(spacing: 8) {
                            // Row com total e preço
                            HStack {
                                Text("Total:")
                                    .font(.headline)
                                    .fontWeight(.regular)
                                    Spacer()
                                Text("US$ \(total, specifier: "%.2f")")
                                    .font(.headline)
                                    .bold()
                                }
                            .padding(.vertical, 16)
                            
                            // Botão
                            Button {
                                print("checkout")
                                navigateToOrder = true
                            } label: {
                                Text("Checkout")
                                    .foregroundStyle(.black)
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity)
                                    .padding()
                                    .background(.fillsTertiary)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                        .background(.white)
                    }
                }
            }
            .navigationTitle("Cart")
            .searchable(text: $search, prompt: "Search")
            .task(id: ids) { // dispara quando IDs mudarem
                print("🧩 IDs no carrinho:", ids)
                await cartviewmodel.reload(byIDs: ids)
            }
            .onAppear {
                // debug: ver se os itens estão gravando
                print("📦 CartItems salvos:", cartItems.map { ($0.productId, $0.qty) })
            }

            
            
        }
        
    }
}

#Preview{
    Cart()
}
