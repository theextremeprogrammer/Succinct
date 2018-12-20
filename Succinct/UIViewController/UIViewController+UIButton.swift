import UIKit

// MARK: - Searching by text
extension UIViewController {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return view.findButton(withExactText: searchText)
    }

    public func hasButton(withExactText searchText: String) -> Bool {
        return view
            .findButton(withExactText: searchText)
            .isNotNil()
    }

    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by image
extension UIViewController {
    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return executeWithEnterAndExitDebugLog {
            if let button = view.findButton(withImage: searchImage) {
                return button
            }
            
            return nil
        } as? UIButton
    }

    public func hasButton(withImage searchImage: UIImage) -> Bool {
        return view
            .findButton(withImage: searchImage)
            .isNotNil()
    }

    public func tapButton(withImage searchImage: UIImage) {
        view.findButton(withImage: searchImage)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Searching by state
extension UIViewController {
    public func findButtons(withState state: UIControl.State) -> [UIButton] {
        return view.findButtons(withState: state)
    }
}

// MARK: - Debugging
fileprivate extension UIViewController {
    private func executeWithEnterAndExitDebugLog(closure: () -> UIView?) -> UIView? {
        Succinct.log.debug("<\(String(describing: type(of: self)))>")
        
        if let result = closure() {
            return result
        }
        
        Succinct.log.debug("</\(String(describing: type(of: self)))>")
        return nil
    }
}
