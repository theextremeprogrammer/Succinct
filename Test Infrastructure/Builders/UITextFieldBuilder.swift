import UIKit

struct UITextFieldBuilder {
    private var textField: UITextField

    init() {
        textField = UITextField()
    }

    func withPlaceholderText(_ placeholderText: String) -> UITextFieldBuilder {
        textField.placeholder = placeholderText
        return self
    }

    func withText(_ text: String) -> UITextFieldBuilder {
        textField.text = text
        return self
    }

    func build() -> UITextField {
        return textField
    }
}
