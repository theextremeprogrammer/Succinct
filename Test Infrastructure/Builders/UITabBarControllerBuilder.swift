import UIKit

final class UITabBarControllerBuilder {
    private var tabBarController: UITabBarController
    private var viewControllers: [UIViewController]

    init() {
        tabBarController = UITabBarController()
        viewControllers = []
    }

    func withViewController(withTitle title: String) -> UITabBarControllerBuilder {
        let viewController = UIViewController()
        viewController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        viewControllers.append(viewController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        return self
    }

    func build() -> UITabBarController {
        return tabBarController
    }
}
