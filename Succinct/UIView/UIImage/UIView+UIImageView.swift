import UIKit

// MARK: - UIImageView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UIImageView object whose image matches the provided search image.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: A boolean value indicating if a UIImageView was found or not.
    ///
    @objc internal func hasImageView(withImage searchImage: UIImage) -> Bool {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isImageView(withImage: searchImage) })
        )
            .isNotNil()
    }
    
    ///
    /// Searches the entire view hierarchy of the current view for a UIImageView object whose image matches the provided search image.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIImageView, if one is found.
    ///
    @objc internal func findImageView(withImage searchImage: UIImage) -> UIImageView? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition({ $0.isImageView(withImage: searchImage) })
        ) as? UIImageView
    }
}
