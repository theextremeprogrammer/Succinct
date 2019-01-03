import UIKit

final class UICollectionViewBuilder {
    private var cellConfigurations: [IndexPath : UICollectionViewCellConfiguration] = [:]
    
    func withCellConfiguration(_ cellConfiguration: UICollectionViewCellConfiguration) -> UICollectionViewBuilder {
        cellConfigurations[cellConfiguration.indexPath] = cellConfiguration
        return self
    }
    
    func build() -> UICollectionView {
        let config = UICollectionViewConfiguration(
            cellDefinitions: cellConfigurations
        )
        
        return UnitTestCollectionView(configuration: config)
    }
}
