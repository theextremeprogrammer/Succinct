import UIKit
struct UINavigationControllerBuilder {
    private var navigationController: UINavigationController
    init() {
        navigationController = UINavigationController()
    }

    func withSubview(_ subview: UIView) -> UINavigationControllerBuilder {
        navigationController.view.addSubview(subview)
        return self
    }

    func withSubviews(_ subviews: UIView...) -> UINavigationControllerBuilder {
        subviews.forEach { subview in
            navigationController.view.addSubview(subview)
        }
        return self
    }

    func withNavigationItemTitleView(_ titleView: UIView) -> UINavigationControllerBuilder {
        navigationController.navigationItem.titleView = titleView
        return self
    }

    func withLeftBarButtonItems(_ leftBarButtonItems: [UIBarButtonItem]) -> UINavigationControllerBuilder {
        navigationController.navigationItem.leftBarButtonItems = leftBarButtonItems
        return self
    }

    func withRightBarButtonItems(_ rightBarButtonItems: [UIBarButtonItem]) -> UINavigationControllerBuilder {
        navigationController.navigationItem.rightBarButtonItems = rightBarButtonItems
        return self
    }

    func build() -> UINavigationController {
        return navigationController
    }
}
