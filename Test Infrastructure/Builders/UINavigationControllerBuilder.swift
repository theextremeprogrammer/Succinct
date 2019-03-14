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

    func withNavigationItemTitleView(_ titleView: UIView) -> UINavigationControllerBuilder {
        navigationController.navigationItem.titleView = titleView
        return self
    }

    func build() -> UINavigationController {
        return navigationController
    }
}
