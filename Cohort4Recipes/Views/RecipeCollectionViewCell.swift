import UIKit

class RecipeCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleBGView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    var recipe: Recipe?

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = 10
    }
    
    func setup(with recipe: Recipe) {
        imageView.image = UIImage(named: "edfarm")
        titleBGView.backgroundColor = recipe.recipeType.color
        titleLabel.text = recipe.title
    }
}
