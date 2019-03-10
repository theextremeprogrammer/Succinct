import Foundation

struct NSMutableAttributedStringBuilder {
    private var attributedString: NSMutableAttributedString

    init(withText text: String) {
        attributedString = NSMutableAttributedString(string: text)
    }

    func withAttributes(
        _ attributes: [NSAttributedString.Key : Any],
        range: NSRange
    ) -> NSMutableAttributedStringBuilder {
        attributedString.addAttributes(attributes, range: range)
        return self
    }

    func withAttributes(
        _ attributes: [NSAttributedString.Key : Any],
        forString rangeSearchString: String
    ) -> NSMutableAttributedStringBuilder {
        if let range = attributedString.string.range(of: rangeSearchString) {
            let nsRange = NSRange(range, in: attributedString.string)
            attributedString.addAttributes(attributes, range: nsRange)
        }

        return self
    }

    func build() -> NSMutableAttributedString {
        return attributedString
    }
}
