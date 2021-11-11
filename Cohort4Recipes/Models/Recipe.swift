import Foundation

struct Recipe: Codable {
    var title: String
    var id: UUID
    var notes: String
    var portions: Int
    var recipeType: RecipeType
    var source: String
//    var imageURL: String
    var ingredients: [Ingredient]
    var directions: [String]
    
    enum CodingKeys: String, CodingKey {
        case recipeType = "type"
        case notes = "description"
//        case imageURL = "image"
        case title, id, portions, source, ingredients, directions
    }
}
