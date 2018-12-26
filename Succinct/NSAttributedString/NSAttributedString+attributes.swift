extension NSAttributedString {
    public func hasAttributes(_ searchAttributes: [NSAttributedString.Key: Any], atSubString substring: String) -> Bool {
        var allAttributesFound = [NSAttributedString.Key: NSRange]()
        enumerateAttributes(in: NSRange(location: 0, length: length)) { (attributes, range, stop) in
            for attribute in attributes {
                switch attribute.key {
                case NSAttributedString.Key.font:
                    guard attribute.value is UIFont else { break }
                    allAttributesFound[attribute.key] = range
                case NSAttributedString.Key.backgroundColor:
                    guard attribute.value is UIColor else { break }
                    allAttributesFound[attribute.key] = range
                case NSAttributedString.Key.foregroundColor:
                    guard attribute.value is UIColor else { break }
                    allAttributesFound[attribute.key] = range
                default:
                    break
                }
            }
        }

        guard let range = string.range(of: substring) else { return false }
        let rangeOfSearchText = NSRange(range, in: substring)

        var matchingAttributes = [NSAttributedString.Key]()
        for attribute in allAttributesFound {
            if rangeOfSearchText == attribute.value {
                matchingAttributes.append(attribute.key)
            }
        }

        if matchingAttributes.count == searchAttributes.count {
            return true
        }

        return false
    }
}
