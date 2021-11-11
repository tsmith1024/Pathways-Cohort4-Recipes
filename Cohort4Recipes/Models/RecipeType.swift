import UIKit

enum RecipeType: String, Codable {
    case bread, dessert, pasta
    
    var color: UIColor {
        switch self {
        case .bread:
            return .cyan
        case .dessert:
            return .magenta
        case .pasta:
            return .systemYellow
        }
    }
}
