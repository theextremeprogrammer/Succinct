import UIKit

final class UICollectionViewBuilder {
    
    func build() -> UICollectionView {
        return UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
}
