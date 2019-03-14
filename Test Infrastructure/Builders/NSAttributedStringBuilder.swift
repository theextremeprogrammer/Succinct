import Foundation

struct NSAttributedStringBuilder {
    private var attributedString: NSMutableAttributedString

    init(withText text: String) {
        attributedString = NSMutableAttributedString(string: text)
    }

    func withAttributes(
        _ attributes: [NSAttributedString.Key : Any],
        range: NSRange
    ) -> NSAttributedStringBuilder {
        attributedString.addAttributes(attributes, range: range)
        return self
    }

    func withAttributes(
        _ attributes: [NSAttributedString.Key : Any],
        forString rangeSearchString: String
    ) -> NSAttributedStringBuilder {
        if let range = attributedString.string.range(of: rangeSearchString) {
            let nsRange = NSRange(range, in: attributedString.string)
            attributedString.addAttributes(attributes, range: nsRange)
        }

        return self
    }

    func build() -> NSAttributedString {
        return attributedString.copy() as! NSAttributedString
    }
}
