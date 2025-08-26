//
//  FavoritesService.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 26/08/25.
//

import Foundation
import SwiftData

protocol FavoriteIconServiceProtocol {
    func isFavorite(_ id: Int) throws -> Bool
    func addFavorite(_ id: Int) throws
    func removeFavorite(_ id: Int) throws
}

struct FavoriteIconService: FavoriteIconServiceProtocol {
    private let ctx: ModelContext
    
    init(ctx: ModelContext) {
        self.ctx = ctx
    }
    
    func isFavorite(_ id: Int) throws -> Bool {
        let d = FetchDescriptor<SavedProductRef>(
            predicate: #Predicate { $0.productId == id && $0.isFavorite == true }
        )
        return try ctx.fetchCount(d) > 0
    }
    
    func addFavorite(_ id: Int) throws {
        ctx.insert(SavedProductRef(productId: id, isFavorite: true))
        try ctx.save()
    }
    
    func removeFavorite(_ id: Int) throws {
        let d = FetchDescriptor<SavedProductRef>(
            predicate: #Predicate { $0.productId == id && $0.isFavorite == true }
        )
        try ctx.fetch(d).forEach { ctx.delete($0) }
        try ctx.save()
    }
}
