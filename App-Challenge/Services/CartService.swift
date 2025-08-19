import SwiftData

struct CartService {
    let ctx: ModelContext

    func add(productId: Int, qty: Int = 1) throws {
        if let item = try find(productId) { item.qty += qty }
        else { ctx.insert(CartItem(productId: productId, qty: qty)) }
        try ctx.save()
    }

    func setQty(productId: Int, qty: Int) throws {
        if let item = try find(productId) {
            if qty <= 0 { ctx.delete(item) } else { item.qty = qty }
        } else if qty > 0 {
            ctx.insert(CartItem(productId: productId, qty: qty))
        }
        try ctx.save()
    }

    func remove(productId: Int) throws {
        if let item = try find(productId) { ctx.delete(item); try ctx.save() }
    }

    func find(_ productId: Int) throws -> CartItem? {
        let all = try ctx.fetch(FetchDescriptor<CartItem>())
        return all.first { $0.productId == productId }
    }
}
