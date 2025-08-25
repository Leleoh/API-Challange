//import Foundation
//
//enum ProductCategory: Codable, Identifiable {
//    var id: String { rawValue }
//
//    case beauty, fragrances, furniture, groceries
//    case homeDecoration, kitchenAccessories, laptop
//    case mensShirts, mensShoes, mensWatches
//    case mobileAccessories, motorcycle, skinCare
//    case smartphones, sportsAccessories, sunglasses
//    case tablets, tops, vehicle
//    case womensBags, womensDresses, womensJewellery
//    case womensShoes, womensWatches
//    case unknown(String)
//
//    var rawValue: String {
//        switch self {
//        case .beauty:             return "beauty"
//        case .fragrances:         return "fragrances"
//        case .furniture:          return "furniture"
//        case .groceries:          return "groceries"
//        case .homeDecoration:     return "home decoration"
//        case .kitchenAccessories: return "kitchen accessories"
//        case .laptop:             return "laptop"
//        case .mensShirts:         return "mens shirts"
//        case .mensShoes:          return "mens shoes"
//        case .mensWatches:        return "mens watches"
//        case .mobileAccessories:  return "mobile-accessories"
//        case .motorcycle:         return "motorcycle"
//        case .skinCare:           return "skin care"
//        case .smartphones:        return "smartphones"
//        case .sportsAccessories:  return "sports accessories"
//        case .sunglasses:         return "sunglasses"
//        case .tablets:            return "tablets"
//        case .tops:               return "tops"
//        case .vehicle:            return "vehicle"
//        case .womensBags:         return "womens bags"
//        case .womensDresses:      return "womens dresses"
//        case .womensJewellery:    return "womens jewellery"
//        case .womensShoes:        return "womens shoes"
//        case .womensWatches:      return "womens watches"
//        case .unknown(let s):     return s
//        }
//    }
//
//    init(from decoder: Decoder) throws {
//        let v = try decoder.singleValueContainer().decode(String.self)
//        switch v {
//        case "beauty":               self = .beauty
//        case "fragrances":           self = .fragrances
//        case "furniture":            self = .furniture
//        case "groceries":            self = .groceries
//        case "home decoration":      self = .homeDecoration
//        case "kitchen accessories":  self = .kitchenAccessories
//        case "laptop":               self = .laptop
//        case "mens shirts":          self = .mensShirts
//        case "mens shoes":           self = .mensShoes
//        case "mens watches":         self = .mensWatches
//        case "mobile-accessories":   self = .mobileAccessories
//        case "motorcycle":           self = .motorcycle
//        case "skin care":            self = .skinCare
//        case "smartphones":          self = .smartphones
//        case "sports accessories":   self = .sportsAccessories
//        case "sunglasses":           self = .sunglasses
//        case "tablets":              self = .tablets
//        case "tops":                 self = .tops
//        case "vehicle":              self = .vehicle
//        case "womens bags":          self = .womensBags
//        case "womens dresses":       self = .womensDresses
//        case "womens jewellery":     self = .womensJewellery
//        case "womens shoes":         self = .womensShoes
//        case "womens watches":       self = .womensWatches
//        default:                     self = .unknown(v)
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var c = encoder.singleValueContainer()
//        try c.encode(rawValue)
//    }
//}
//
//extension ProductCategory {
//    /// Nome “bonitinho” pro fallback (capitaliza palavras e troca hífen por espaço)
//    private var fallbackTitle: String {
//        rawValue
//            .replacingOccurrences(of: "-", with: " ")
//            .split(separator: " ")
//            .map { $0.capitalized }
//            .joined(separator: " ")
//    }
//
//    /// Código base para lookup no dicionário (normalizado)
//    private var key: String {
//        rawValue.lowercased()
//            .replacingOccurrences(of: " ", with: "_")
//            .replacingOccurrences(of: "-", with: "_")
//    }
//
//    /// Tradução embutida no código (por idioma)
//    func displayName(locale: Locale = .current) -> String {
//        let lang = (locale.language.languageCode?.identifier ?? "en").lowercased()
//        let dict: [String:String]
//
//        switch lang {
//        case "pt": // pt-BR / pt-PT (pode especializar se quiser)
//            dict = Self.ptBR
//        case "es":
//            dict = Self.esES // opcional; remova se não for usar
//        default:
//            dict = Self.enUS
//        }
//
//        return dict[key] ?? fallbackTitle
//    }
//
//    // MARK: - Dicionários
//    private static let enUS: [String:String] = [
//        "beauty":"Beauty",
//        "fragrances":"Fragrances",
//        "furniture":"Furniture",
//        "groceries":"Groceries",
//        "home_decoration":"Home Decoration",
//        "kitchen_accessories":"Kitchen Accessories",
//        "laptop":"Laptops",
//        "mens_shirts":"Men's Shirts",
//        "mens_shoes":"Men's Shoes",
//        "mens_watches":"Men's Watches",
//        "mobile_accessories":"Mobile Accessories",
//        "motorcycle":"Motorcycles",
//        "skin_care":"Skin Care",
//        "smartphones":"Smartphones",
//        "sports_accessories":"Sports Accessories",
//        "sunglasses":"Sunglasses",
//        "tablets":"Tablets",
//        "tops":"Tops",
//        "vehicle":"Vehicles",
//        "womens_bags":"Women's Bags",
//        "womens_dresses":"Women's Dresses",
//        "womens_jewellery":"Women's Jewellery",
//        "womens_shoes":"Women's Shoes",
//        "womens_watches":"Women's Watches"
//    ]
//
//    private static let ptBR: [String:String] = [
//        "beauty":"Beleza",
//        "fragrances":"Fragrâncias",
//        "furniture":"Móveis",
//        "groceries":"Mercearia",
//        "home_decoration":"Decoração de casa",
//        "kitchen_accessories":"Acessórios de cozinha",
//        "laptop":"Laptops",
//        "mens_shirts":"Camisas masculinas",
//        "mens_shoes":"Calçados masculinos",
//        "mens_watches":"Relógios masculinos",
//        "mobile_accessories":"Acessórios para celular",
//        "motorcycle":"Motocicletas",
//        "skin_care":"Cuidados com a pele",
//        "smartphones":"Smartphones",
//        "sports_accessories":"Acessórios esportivos",
//        "sunglasses":"Óculos de sol",
//        "tablets":"Tablets",
//        "tops":"Blusas",
//        "vehicle":"Veículos",
//        "womens_bags":"Bolsas femininas",
//        "womens_dresses":"Vestidos femininos",
//        "womens_jewellery":"Joias femininas",
//        "womens_shoes":"Calçados femininos",
//        "womens_watches":"Relógios femininos"
//    ]
//
//    private static let esES: [String:String] = [
//        "beauty":"Belleza",
//        "fragrances":"Fragancias",
//        "furniture":"Muebles",
//        "groceries":"Comestibles",
//        "home_decoration":"Decoración del hogar",
//        "kitchen_accessories":"Accesorios de cocina",
//        "laptop":"Portátiles",
//        "mens_shirts":"Camisas de hombre",
//        "mens_shoes":"Zapatos de hombre",
//        "mens_watches":"Relojes de hombre",
//        "mobile_accessories":"Accesorios móviles",
//        "motorcycle":"Motocicletas",
//        "skin_care":"Cuidado de la piel",
//        "smartphones":"Smartphones",
//        "sports_accessories":"Accesorios deportivos",
//        "sunglasses":"Gafas de sol",
//        "tablets":"Tabletas",
//        "tops":"Blusas",
//        "vehicle":"Vehículos",
//        "womens_bags":"Bolsos de mujer",
//        "womens_dresses":"Vestidos de mujer",
//        "womens_jewellery":"Joyas de mujer",
//        "womens_shoes":"Zapatos de mujer",
//        "womens_watches":"Relojes de mujer"
//    ]
//}

import Foundation

// Tradução de categorias vindas da API (en) -> pt-BR
private let category_ptBR: [String: String] = [
    "beauty":"Beleza",
    "fragrances":"Fragrâncias",
    "furniture":"Móveis",
    "groceries":"Mercearia",
    "home decoration":"Decoração de casa",
    "kitchen accessories":"Acessórios de cozinha",
    "laptop":"Laptops",
    "mens shirts":"Camisas masculinas",
    "mens shoes":"Calçados masculinos",
    "mens watches":"Relógios masculinos",
    "mobile-accessories":"Acessórios para celular",
    "motorcycle":"Motocicletas",
    "skin care":"Cuidados com a pele",
    "smartphones":"Smartphones",
    "sports accessories":"Acessórios esportivos",
    "sunglasses":"Óculos de sol",
    "tablets":"Tablets",
    "tops":"Blusas",
    "vehicle":"Veículos",
    "womens bags":"Bolsas femininas",
    "womens dresses":"Vestidos femininos",
    "womens jewellery":"Joias femininas",
    "womens shoes":"Calçados femininos",
    "womens watches":"Relógios femininos"
]

extension String {
    /// Retorna o nome traduzido da categoria (fallback: formata bonitinho o texto original)
    func categoryDisplayName(locale: Locale = .current) -> String {
        // normaliza exatamente como vem da API (minúsculo; preserva espaço e hífen)
        let key = self.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)

        // aqui você pode trocar pelo idioma que quiser; por enquanto focamos em pt-BR
        if Locale.current.language.languageCode?.identifier.lowercased() == "pt" {
            if let t = category_ptBR[key] { return t }
        }

        // fallback: capitaliza e troca hífen por espaço
        return key
            .replacingOccurrences(of: "-", with: " ")
            .split(separator: " ")
            .map { $0.capitalized }
            .joined(separator: " ")
    }
}
