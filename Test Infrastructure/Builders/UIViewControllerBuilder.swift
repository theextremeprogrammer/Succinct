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

    func withNavigationItemTitleView(_ titleView: UIView) -> UIViewControllerBuilder {
        viewController.navigationItem.titleView = titleView
        return self
    }

    func withTitle(_ title: String) -> UIViewControllerBuilder {
        viewController.title = title
        return self
    }

    func withLeftBarButtonItem(
        systemItem: UIBarButtonItem.SystemItem,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: systemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.addLeftBarButtonItem(barButtonItem)
        
        return self
    }

    func withLeftBarButtonItem(
        title: String,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.addLeftBarButtonItem(barButtonItem)

        return self
    }

    func withRightBarButtonItem(
        systemItem: UIBarButtonItem.SystemItem,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: systemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.addRightBarButtonItem(barButtonItem)
        
        return self
    }

    func withRightBarButtonItem(
        title: String,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.addRightBarButtonItem(barButtonItem)

        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}

private extension UINavigationItem {
    func addLeftBarButtonItem(_ item: UIBarButtonItem) {
        if leftBarButtonItems.isNil() {
            leftBarButtonItems = []
        }

        leftBarButtonItems?.append(item)
    }

    func addRightBarButtonItem(_ item: UIBarButtonItem) {
        if rightBarButtonItems.isNil() {
            rightBarButtonItems = []
        }

        rightBarButtonItems?.append(item)
    }
}
