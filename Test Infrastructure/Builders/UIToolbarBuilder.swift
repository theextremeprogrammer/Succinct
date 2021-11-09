import UIKit

struct UIToolbarBuilder {
    private var toolbar: UIToolbar

    init() {
        toolbar = UIToolbar()
    }

    func withBarButtonItem(
        systemItem: UIBarButtonItem.SystemItem,
        targetAction: TargetAction
    ) -> UIToolbarBuilder {
        let barButtonItem = UIBarButtonItem(
            barButtonSystemItem: systemItem,
            target: targetAction,
            action: #selector(TargetAction.action(sender:))
        )

        if toolbar.items != nil {
            toolbar.items?.append(barButtonItem)
        } else {
            toolbar.items = [barButtonItem]
        }

        return self
    }

    func withBarButtonItem(
        title: String,
        targetAction: TargetAction
    ) -> UIToolbarBuilder {
        let barButtonItem = UIBarButtonItem(
            title: title,
            style: .plain,
            target: self,
            action: #selector(TargetAction.action(sender:))
        )

        if toolbar.items != nil {
            toolbar.items?.append(barButtonItem)
        } else {
            toolbar.items = [barButtonItem]
        }

        return self
    }

    func build() -> UIToolbar {
        return toolbar
    }
}
