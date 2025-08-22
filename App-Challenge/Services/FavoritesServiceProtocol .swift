//
//  FavoritesServiceProtocol .swift
//  App-Challenge
//
//  Created by Gustavo Melleu on 22/08/25.
//

import Foundation


import Foundation

protocol FavoritesServiceProtocol {
    func fetchSavedFavorite(productId: Int) async throws -> SavedProductRef?
    func fetchSavedFavorites() async throws -> [SavedProductRef]
}
