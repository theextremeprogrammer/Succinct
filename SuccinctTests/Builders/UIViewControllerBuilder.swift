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
    
    func withBackgroundColor(_ color: UIColor) -> UIViewControllerBuilder {
        viewController.view.backgroundColor = color
        return self
    }

    func withNavigationController(_ navigationController: UINavigationController) -> UIViewControllerBuilder {
        navigationController.setViewControllers([viewController], animated: false)
        return self
    }

    func withNavigationBarTitle(_ title: String) -> UIViewControllerBuilder {
        viewController.title = title
        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}
