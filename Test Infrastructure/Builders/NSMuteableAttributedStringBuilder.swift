import Foundation

struct NSMutableAttributedStringBuilder {
    private var attributedString: NSMutableAttributedString

    init(withText text: String) {
        attributedString = NSMutableAttributedString(string: text)
    }

    func withAttributes(_ attributes: [NSAttributedString.Key : Any], range: NSRange) -> NSMutableAttributedStringBuilder {
        attributedString.addAttributes(attributes, range: range)
        return self
    }

    func build() -> NSMutableAttributedString {
        return attributedString
    }
}
