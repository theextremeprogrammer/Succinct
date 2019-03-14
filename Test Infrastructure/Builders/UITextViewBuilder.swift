import UIKit

struct UITextViewBuilder {
    private var textView: UITextView

    init() {
        textView = UITextView()
    }

    func withText(_ text: String) -> UITextViewBuilder {
        textView.text = text
        return self
    }

    func withAttributedText(_ attributedText: NSAttributedString) -> UITextViewBuilder {
        textView.attributedText = attributedText
        return self
    }

    func build() -> UITextView {
        return textView
    }
}
