import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        for subview in subviews {
            if let button = subview as? UIButton {
                if button.title(for: .normal) == searchText {
                    return button
                } else {
                    if let buttonTitle = button.title(for: .normal) {
                        Succinct.log.debug("**** Succinct: findButton(withExactText: '\(searchText)') failed to match for button with title: '\(buttonTitle)'")
                    } else {
                        let noTitleMessage = "nil (no title text set for this button)"
                        Succinct.log.debug("**** Succinct: findButton(withExactText: '\(searchText)') failed to match for button with title: \(noTitleMessage)")
                    }
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
