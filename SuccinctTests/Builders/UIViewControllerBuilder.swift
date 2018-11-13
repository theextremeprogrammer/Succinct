import UIKit

struct UIViewControllerBuilder {
    private var viewController: UIViewController

    init() {
        viewController = UIViewController()
    }

    func withSubview(_ subview: UIView) -> UIViewControllerBuilder {
        viewController.view.addSubview(subview)
        return self
    }
    
    func withSubviews(_ subviews: UIView...) -> UIViewControllerBuilder {
        subviews.forEach { subview in
            viewController.view.addSubview(subview)
        }
        
        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}
