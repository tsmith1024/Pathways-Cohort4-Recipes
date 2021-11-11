import UIKit

class RecipeFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        
        guard let collectionView = collectionView else { return }
        
        let availableWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        let cellWidth = (availableWidth / CGFloat(2)).rounded(.down)
        itemSize = CGSize(width: cellWidth, height: cellWidth)
        sectionInset = UIEdgeInsets(top: minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        sectionInsetReference = .fromSafeArea
    }
}
