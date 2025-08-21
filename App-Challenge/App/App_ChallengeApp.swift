//
//  App_ChallengeApp.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 13/08/25.
//

import SwiftUI
import SwiftData
@main
struct App_ChallengeApp: App {
    var body: some Scene {
        WindowGroup {TabBar()}
        .modelContainer(for: [SavedProductRef.self, CartItem.self, Order.self, OrderItem.self])
    }
}
