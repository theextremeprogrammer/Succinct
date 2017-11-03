import UIKit

struct UIButtonBuilder {
    private var button: UIButton

    init() {
        button = UIButton()
    }

    func withTitleText(_ titleText: String) -> UIButtonBuilder {
        button.titleLabel?.text = titleText
        return self
    }

    func build() -> UIButton {
        return button
    }
}
