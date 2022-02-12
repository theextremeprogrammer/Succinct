import UIKit

// MARK: - Testing
extension UIViewController {
    @objc public func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
}
