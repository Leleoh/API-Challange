//
//  MockFAvoritesService.swift
//  App-ChallengeTests
//
//  Created by Gustavo Melleu on 22/08/25.
//

import Foundation
@testable import App_Challenge


final class MockFavoriteIconService: FavoriteIconServiceProtocol {
    
    private var storage: Set<Int> = []
    
    func isFavorite(_ id: Int) throws -> Bool {
        storage.contains(id)
    }
    
    func addFavorite(_ id: Int) throws {
        storage.insert(id)
    }
    
    func removeFavorite(_ id: Int) throws {
        storage.remove(id)
    }
    
}

