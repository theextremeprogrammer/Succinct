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

    func withInputAccessoryView(_ inputAccessoryView: UIView) -> UITextFieldBuilder {
        textField.inputAccessoryView = inputAccessoryView
        return self
    }

    func build() -> UITextField {
        return textField
    }
}
