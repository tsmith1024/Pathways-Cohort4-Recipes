import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var recipeList: [Recipe] = TestData.testRecipes

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib(nibName: "RecipeCollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "RecipeCell")
        let layout = RecipeFlowLayout()
        layout.minimumInteritemSpacing = 8.0
        
        collectionView.collectionViewLayout = layout
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? RecipeDetailViewController,
           let sender = sender as? Recipe {
            destination.recipe = sender
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recipeList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RecipeCell", for: indexPath) as! RecipeCollectionViewCell
        
        cell.setup(with: recipeList[indexPath.item])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let recipe = recipeList[indexPath.item]
        performSegue(withIdentifier: "RecipeDetailSegue", sender: recipe)
    }
}
