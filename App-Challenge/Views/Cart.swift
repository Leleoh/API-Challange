////
////  Cart.swift
////  App-Challenge
////
////  Created by Gustavo Melleu on 14/08/25.
////
//


import Foundation
import SwiftUI
import SwiftData

struct Cart: View {
    @StateObject private var vm = CartViewModel()

   
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
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                    }

                    
                    
                    
                       

                }
                .safeAreaInset(edge: .bottom){
                    
                    VStack{
                        HStack {
                        Text("Total:")
                            .font(.headline)
                            Spacer()
                            Text("US$ \(total.formatted(.number.precision(.fractionLength(2))))")
                            .font(.headline)
                            .bold()
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 12)
                    
                        Button {
                            Task {
                                do {
                                    let service = OrderService(ctx: ctx, productService: ProductService())
                                    _ = try await service.checkout()
                                  
                                    print("Pedido criado!")
                                 
                                } catch {
                                    print("Erro no checkout:", error)
                                }
                            }
                        } label: {
                            Text("Checkout")
                                .foregroundStyle(.black)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(.fillsTertiary)
                                .clipShape(RoundedRectangle(cornerRadius: 16))
                        }
                        .padding()
                        }
                    }
            }

            
            
        }
        .navigationTitle("Cart")
        .searchable(text: $search, prompt: "Search")
        .task(id: ids) {
            print(" IDs no carrinho:", ids)
            await vm.reload(byIDs: ids)
        }
        .onAppear {
           
            print(" CartItems salvos:", cartItems.map { ($0.productId, $0.qty) })
        }
        
    }
}

#Preview{
    Cart()
}
