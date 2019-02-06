import UIKit

extension UIViewController {
    public func tapBarButtonItem(withSystemItem systemItem: UIBarButtonItem.SystemItem) {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            if leftBarButtonItem.systemItem == systemItem {
                leftBarButtonItem.tap()
            }
        }

        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            if rightBarButtonItem.systemItem == systemItem {
                rightBarButtonItem.tap()
            }
        }
    }
}
