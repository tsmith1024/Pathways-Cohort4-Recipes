import UIKit

class RecipeDetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeTypeLabel: UILabel!
    @IBOutlet weak var portionsLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var detailSegmentedControl: UISegmentedControl!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var detailTextView: UITextView!
    
    let ingredientCellID = "IngredientCell"
    let directionCellID = "DirectionCell"
    
    var recipe: Recipe = TestData.testRecipes[0]
    
    // can be easily reordered
    enum DetailState: Int {
        case ingredients, directions, notes
    }
    
    var detailState: DetailState = .ingredients
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ingredientNib = UINib(nibName: "IngredientTableViewCell", bundle: Bundle.main)
        let directionNib = UINib(nibName: "DirectionTableViewCell", bundle: Bundle.main)
        detailTableView.register(ingredientNib, forCellReuseIdentifier: ingredientCellID)
        detailTableView.register(directionNib, forCellReuseIdentifier: directionCellID)
        setupUI()
        title = ""
    }
    
    func setupUI() {
        titleLabel.text = recipe.title

        recipeTypeLabel.text = recipe.recipeType.rawValue.capitalized
        // round off those corners
        recipeTypeLabel.layer.cornerRadius = recipeTypeLabel.frame.height / 2.0
        // important to actually show the rounded corners
        recipeTypeLabel.layer.masksToBounds = true
        recipeTypeLabel.backgroundColor = recipe.recipeType.color

        portionsLabel.text = "\(recipe.portions) Portions"

        imageView.image = UIImage(named: "edfarm")

        detailTextView.text = recipe.notes
        
        
        detailTableView.estimatedRowHeight = 44.0
        detailTableView.rowHeight = UITableView.automaticDimension
    }
    
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        detailState = DetailState(rawValue: sender.selectedSegmentIndex) ?? .ingredients
        updateDetailSection()
    }
    
    func updateDetailSection() {
        switch detailState {
        case .ingredients, .directions:
            detailTableView.isHidden = false
            detailTextView.isHidden = true
            detailTableView.reloadData()
        case .notes:
            detailTextView.isHidden = false
            detailTableView.isHidden = true
        }
    }
}

extension RecipeDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch detailState {
        case .ingredients:
            return recipe.ingredients.count
        case .directions:
            return recipe.directions.count
        case .notes:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if detailState == .ingredients {
            if let cell = tableView.dequeueReusableCell(withIdentifier: ingredientCellID, for: indexPath) as? IngredientTableViewCell {
                cell.ingredientLabel.text = "\(recipe.ingredients[indexPath.row])"
                return cell
            }
        } else if detailState == .directions {
            if let cell = tableView.dequeueReusableCell(withIdentifier: directionCellID, for: indexPath) as? DirectionTableViewCell {
                cell.directionStepLabel.text = "\(indexPath.row)"
                cell.directionTextview.text = recipe.directions[indexPath.row]
                return cell
            }
        }
        
        return UITableViewCell()
    }
}
