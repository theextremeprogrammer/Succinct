import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        for subview in subviews {
            if let button = subview as? UIButton {
                if button.title(for: .normal) == searchText {
                    return button
                } else {
                    print("**** Succinct: findButton(withExactText: '\(searchText)') failed for button with title: '\(String(describing: button.title(for: .normal)!))'")
                }
            }
            
            if let button = subview.findButton(withExactText: searchText) {
                return button
            }
        }

        return nil
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return subviews
            .compactMap { $0 as? UIButton ?? $0.findButton(withImage: searchImage) }
            .filter { $0.image(for: .normal) == searchImage }
            .first
    }

    public func findButtons(withState searchState: UIControl.State) -> [UIButton] {
        var buttons: [UIButton] = []

        for subview in subviews {
            if let button = subview as? UIButton {
                if button.state == searchState {
                    buttons.append(button)
                }
            }

            buttons.append(contentsOf: subview.findButtons(withState: searchState))
        }

        return buttons
    }
}
