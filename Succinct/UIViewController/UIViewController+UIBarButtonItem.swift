import UIKit

extension UIViewController {
    public func tapLeftBarButtonItem() {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            leftBarButtonItem.tap()
        }
    }
    
    public func tapBarButtonItem(withSystemItem systemItem: UIBarButtonItem.SystemItem) {
        if let leftBarButtonItem = navigationItem.leftBarButtonItem {
            if leftBarButtonItem.systemItem == systemItem.rawValue {
                leftBarButtonItem.tap()
            }
        }

        if let rightBarButtonItem = navigationItem.rightBarButtonItem {
            if rightBarButtonItem.systemItem == systemItem.rawValue {
                rightBarButtonItem.tap()
            }
        }
    }
}
