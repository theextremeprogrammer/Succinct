import UIKit

struct UICollectionViewCellConfiguration {
    let indexPath: IndexPath
    let subviews: [UIView]

    init(
        indexPath: IndexPath,
        subviews: [UIView] = []
    ) {
        self.indexPath = indexPath
        self.subviews = subviews
    }
}
