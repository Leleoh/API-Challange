
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
