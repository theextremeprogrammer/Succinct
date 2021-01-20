import UIKit

struct UILabelBuilder {
    private var label: UILabel

    init() {
        label = UILabel()
    }

    func withTitleText(_ titleText: String) -> UILabelBuilder {
        label.text = titleText
        return self
    }

    func isHidden() -> UILabelBuilder {
        label.isHidden = true
        return self
    }

    func build() -> UILabel {
        return label
    }
}
