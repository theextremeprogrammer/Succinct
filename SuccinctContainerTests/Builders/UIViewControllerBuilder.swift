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

    func withLeftBarButtonItem(
            barButtonSystemItem: UIBarButtonItem.SystemItem,
            targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: barButtonSystemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.leftBarButtonItem = barButtonItem

        return self
    }

    func withRightBarButtonItem(
        barButtonSystemItem: UIBarButtonItem.SystemItem,
        targetAction: TargetAction
    ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: barButtonSystemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )
        
        viewController.navigationItem.rightBarButtonItem = barButtonItem
        
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
