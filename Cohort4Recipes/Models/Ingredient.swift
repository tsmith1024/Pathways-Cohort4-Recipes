import Foundation

struct Ingredient: Codable, CustomStringConvertible {
    var name: String
    var amount: String
    
    var description: String {
        "\(amount) - \(name)"
    }
}
