import UIKit

// MARK: - UIView
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIView whose background color matches the searchColor.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchColor: UIColor to compare to the backgroundColor of any UIView objects that are found.
    /// - Returns: A boolean value indicating if a UIView object was found or not.
    @objc public func hasView(withBackgroundColor searchColor: UIColor) -> Bool {
        return view.hasView(withBackgroundColor: searchColor)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for all UIView objects whose background color matches the provided searchColor.
    ///
    /// - Parameter searchColor: UIColor to compare to the backgroundColor of any UIView objects that are found.
    /// - Returns: An integer representing the total number of views found where the searchColor matches the backgroundColor of a UIView object.
    @objc public func countOfViews(withBackgroundColor searchColor: UIColor) -> Int {
        return view.countOfViews(withBackgroundColor: searchColor)
    }
}
