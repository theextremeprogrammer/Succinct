import UIKit

extension UIViewController {
    ///
    /// Searches the view controller's `navigationItem.leftBarButtonIttem` and `navigationItem.rightBarButtonItem` for a UIBarButtonItem whose `SystemItem` matches the searchSystemItem and then attempts to tap the UIBarButtonItem by firing its associated target event, if one exists.
    ///
    /// - Parameter searchSystemItem: `UIBarButtonItem.SystemItem` to compare to the UIBarButtonItem objects that are found.
    ///
    /// - Note: This method is convenient for de-coupling from the details of where the searchSystemItem is located.
    ///
    public func tapBarButtonItem(withSystemItem searchSystemItem: UIBarButtonItem.SystemItem) {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            if leftBarButtonItem.systemItem == searchSystemItem {
                leftBarButtonItem.tap()
            }
        }

        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            if rightBarButtonItem.systemItem == searchSystemItem {
                rightBarButtonItem.tap()
            }
        }

        if let barButtonItem = view.findBarButtonItem(systemItem: searchSystemItem) {
            barButtonItem.tap()
        }
    }

    ///
    /// Attempts to tap the view controller's `navigationItem.leftBarButtonItem` UIBarButtonItem object regardless of what it is (so long as one exists) by firing its associated target event, if one exists.
    ///
    public func tapLeftBarButtonItem() {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            leftBarButtonItem.tap()
        }
    }

    ///
    /// Attempts to tap the view controller's `navigationItem.rightBarButtonItem` UIBarButtonItem object regardless of what it is (so long as one exists) by firing its associated target event, if one exists.
    ///
    public func tapRightBarButtonItem() {
        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            rightBarButtonItem.tap()
        }
    }
}
