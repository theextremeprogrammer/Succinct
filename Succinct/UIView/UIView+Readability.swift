import UIKit

// MARK: - Convenience Properties
extension UIView {
    ///
    /// Convenience method which indicates if the view is visible or not. This can be helpful when writing assertions as opposed to testing the isHidden property.
    ///
    @objc internal var isVisible: Bool {
        get {
            return !isHidden
        }
    }
}
