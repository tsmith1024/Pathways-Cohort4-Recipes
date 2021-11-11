import UIKit

enum RecipeType: String, Codable {
    case bread, dessert, meat, pasta, soup
    
    var color: UIColor {
        switch self {
        case .bread:
            return UIColor(named: "Yellow")!
        case .dessert:
            return UIColor(named: "Blue")!
        case .meat:
            return UIColor(named: "Red")!
        case .pasta:
            return UIColor(named: "Purple")!
        case .soup:
            return UIColor(named: "Green")!
        }
    }
}
