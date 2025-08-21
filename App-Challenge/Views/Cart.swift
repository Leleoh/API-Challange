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


import SwiftUI
import SwiftData

struct Cart: View {
    @StateObject private var vm = CartViewModel()

    // observa TUDO de CartItem; ordenamos em memória
    @Query private var cartItems: [CartItem]
    @Environment(\.modelContext) private var ctx

    @State private var search = ""
    
    var total: Double {
        cartItems.reduce(0) { partial, item in
            if let product = vm.products.first(where: { $0.id == item.productId }) {
                return partial + (product.price * Double(item.qty))
            }
            return partial
        }
    }

    var body: some View {
        let ordered = cartItems.sorted { $0.addedAt > $1.addedAt }
        let ids = ordered.map { $0.productId }

        let filtered = vm.products.filter {
            search.isEmpty ? true :
            $0.title.localizedCaseInsensitiveContains(search) ||
            $0.category.localizedCaseInsensitiveContains(search)
        }

        Group {
              if filtered.isEmpty {
                CartEmptyState()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(filtered, id: \.id) { p in
                            ProductListPillStepper(product: p)
                            // seu componente
                        }
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 12)
                    
                    HStack {
                        Text("Total:")
                            .font(.headline)
                            Spacer()
                        Text("US$ \(total, specifier: "%.2f")")
                            .font(.headline)
                            .bold()
                        }
                    Button {
                        Task { // async porque o checkout busca produtos na API
                            do {
                                let service = OrderService(ctx: ctx, productService: ProductService())
                                _ = try await service.checkout()
                                // (opcional) feedback:
                                print("✅ Pedido criado!")
                                // (opcional) navegar para Orders
                                // navigationPath / Tab selection, conforme sua navegação
                            } catch {
                                print("❌ Erro no checkout:", error)
                            }
                        }
                    } label: {
                        Text("Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(.blue)
                            .foregroundStyle(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                    .padding()
                       
                }
            }
        }
        .navigationTitle("Cart")
        .searchable(text: $search, prompt: "Search")
        .task(id: ids) { // dispara quando IDs mudarem
            print("🧩 IDs no carrinho:", ids)
            await vm.reload(byIDs: ids)
        }
        .onAppear {
            // debug: ver se os itens estão gravando
            print("📦 CartItems salvos:", cartItems.map { ($0.productId, $0.qty) })
        }
    }
}
