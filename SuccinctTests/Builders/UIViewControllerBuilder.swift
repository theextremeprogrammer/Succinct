import UIKit

struct UIViewControllerBuilder {
    private var viewController: UIViewController

    init() {
        viewController = UIViewController()
    }

    func withSubview(_ subView: UIView) -> UIViewControllerBuilder {
        viewController.view.addSubview(subView)
        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}
