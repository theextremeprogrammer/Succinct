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
            barButtonSystemItem: UIBarButtonSystemItem,
            targetAction: TargetAction
        ) -> UIViewControllerBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: UIBarButtonSystemItem.action,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        viewController.navigationItem.leftBarButtonItem = barButtonItem

        return self
    }

    func build() -> UIViewController {
        return viewController
    }
}
