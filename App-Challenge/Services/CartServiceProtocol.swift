//
//  CartServiceProtocol.swift
//  App-Challenge
//
//  Created by Leonel Ferraz Hernandez on 22/08/25.
//

import Foundation

protocol CartServiceProtocol {
    func add(productId: Int, qty: Int) throws
    func setQty(productId: Int, qty: Int) throws
    func remove(productId: Int) throws
    func find(_ productId: Int) throws -> CartItem?
}
