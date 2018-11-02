import UIKit

extension UIViewController {
    public func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
}
