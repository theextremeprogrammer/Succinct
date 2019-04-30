import UIKit

extension UIView {
    func findBarButtonItem(systemItem searchBarButtonItem: UIBarButtonItem.SystemItem) -> UIBarButtonItem? {
        for subview in subviews {
            if let toolbar = subview as? UIToolbar {
                for barButtonItem in toolbar.items ?? [] {
                    if barButtonItem.systemItem == searchBarButtonItem {
                        return barButtonItem
                    }
                }
            }

            if let barButtonItem = subview.findBarButtonItem(systemItem: searchBarButtonItem) {
                return barButtonItem
            }
        }

        return nil
    }
}
