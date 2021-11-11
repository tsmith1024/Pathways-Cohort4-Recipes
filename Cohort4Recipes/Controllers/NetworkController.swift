import Foundation

protocol RecipeListHolder {
    var recipeList: [Recipe] { get set }
}

struct NetworkController {
    static func loadRecipeList(completionHandler: @escaping ([Recipe]) -> Void) {
        let url = URL(string: Constants.baseURL)!
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                print("OH NO -- NO DATA!")
                return
            }
            
            // let's look at the JSON
    //        if let jsonString = String(data: data, encoding: .utf8) {
    //            print(jsonString)
    //        }
            
            let decoder = JSONDecoder()
            if let recipeList = try? decoder.decode([Recipe].self, from: data) {
                print(recipeList)
                // we've got our recipes
                // let's use them!
                completionHandler(recipeList)
            }
        }
        task.resume()
    }
}
