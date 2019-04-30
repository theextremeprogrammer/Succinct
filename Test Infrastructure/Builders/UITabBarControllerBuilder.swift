import UIKit

final class UITabBarControllerBuilder {
    private var tabBarController: UITabBarController
    private var viewControllers: [UIViewController]

    init() {
        tabBarController = UITabBarController()
        viewControllers = []
    }

    func withGenericViewController(withTitle title: String) -> UITabBarControllerBuilder {
        let viewController = UIViewController()
        viewController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        viewControllers.append(viewController)

        tabBarController.setViewControllers(viewControllers, animated: false)

        return self
    }

    func withViewController(_ viewController: UIViewController, withTitle title: String) -> UITabBarControllerBuilder {
        viewController.tabBarItem = UITabBarItem(title: title, image: nil, selectedImage: nil)
        viewControllers.append(viewController)
        
        tabBarController.setViewControllers(viewControllers, animated: false)

        return self
    }

    func build() -> UITabBarController {
        return tabBarController
    }
}
