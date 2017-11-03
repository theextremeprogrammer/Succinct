import UIKit

extension UIView {
    func findButton(withText searchText: String) -> UIButton? {
        for subview in subviews {
            if let button = subview as? UIButton {
                if (button.titleLabel?.text == searchText) {
                    return button
                }
            }

            if (subview.subviews.count > 0) {
                let maybeButton = subview.findButton(withText: searchText)
                if let button = maybeButton {
                    return button
                }
            }
        }

        return nil
    }
}
