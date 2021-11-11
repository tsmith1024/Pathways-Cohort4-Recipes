import Foundation

struct TestData {
    static let testRecipes: [Recipe] = [
        Recipe(
            title: "Test Recipe 1",
            id: UUID(),
            notes: "This is a test recipe. If you are seeing this you are dealing with test data.",
            portions: 3,
            recipeType: .bread,
            source: "https://edfarm.org",
            ingredients: [
                TestData.testIngredients[0],
                TestData.testIngredients[2],
                TestData.testIngredients[1]
            ],
            directions: [
                "Add test data to the recipe.",
                "Test the results using Xcode.",
                "Observe changes needed.",
                "Make necessary changes.",
                "Repeat as needed. Repeat as needed. Repeat as needed. Repeat as needed.",
                "Ship that app!",
            ]
        ),
        Recipe(
            title: "Test Recipe with a longer title than most will be in the real data",
            id: UUID(),
            notes: "This is a test recipe. If you are seeing this you are dealing with test data.",
            portions: 4,
            recipeType: .dessert,
            source: "https://edfarm.org",
            ingredients: [
                TestData.testIngredients[3],
                TestData.testIngredients[2],
                TestData.testIngredients[1]
            ],
            directions: [
                "Add test data to the recipe.",
                "Test the results using Xcode.",
                "Observe changes needed.",
                "Make necessary changes.",
                "Repeat as needed.",
                "Ship that app!",
            ]
        )
    ]
    
    private static let testIngredients = [
        Ingredient(name: "Test Ingredient 1", amount: "4 cups"),
        Ingredient(name: "Test Ingredient 2", amount: "3 ounces"),
        Ingredient(name: "Test Ingredient 3", amount: "1200ml"),
        Ingredient(name: "Test Ingredient 4", amount: "1"),
    ]
}
