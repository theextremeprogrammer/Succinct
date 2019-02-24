extension NSAttributedString {
    public func hasAttributes(_ searchAttributes: [NSAttributedString.Key: Any], atSubString substring: String) -> Bool {
        let foundAttributeKeys = findAttributeKeysMatching(searchAttributes, atSubString: substring)
        let rangeOfSubstring = string.range(of: substring).map { NSRange($0, in: substring) }
        let matchingAttributes = foundAttributeKeys.map {
            filterAttributesMatching(attributeKeys: $0, inRange: rangeOfSubstring)
        }

        return matchingAttributes.count == searchAttributes.count
    }

    fileprivate func findAttributeKeysMatching(
        _ searchAttributes: [NSAttributedString.Key: Any],
        atSubString substring: String
        ) -> [[NSAttributedString.Key: NSRange]] {
        var foundAttributeKeys = [[NSAttributedString.Key: NSRange]]()

        enumerateAttributes(in: NSRange(location: 0, length: length)) { (attributes, range, stop) in
            for attribute in attributes {
                let SearchValue = searchAttributes[attribute.key]
                let value = attribute.value
                switch attribute.key {
                case .font:
                    guard valuesAreEqual(asType: UIFont.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .backgroundColor:
                    guard valuesAreEqual(asType: UIColor.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .foregroundColor:
                    guard valuesAreEqual(asType: UIColor.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .underlineStyle:
                    guard   valuesAreEqual(asType: NSUnderlineStyle.self, a: SearchValue, b: value) ||
                        valuesAreEqual(asType: Int.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .underlineColor:
                    guard valuesAreEqual(asType: UIColor.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .link:
                    guard valuesAreEqual(asType: String.self, a: SearchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key: range])

                default:
                    break
                }
            }
        }

        return foundAttributeKeys
    }

    fileprivate func filterAttributesMatching(
        attributeKeys: [NSAttributedString.Key: NSRange],
        inRange range: NSRange?) -> [NSAttributedString.Key: NSRange] {
        return attributeKeys.filter { $0.value == range }
    }

    fileprivate func valuesAreEqual<T: Equatable>(asType type: T.Type, a: Any?, b: Any?) -> Bool {
        guard let a = a as? T, let b = b as? T else { return false }

        return a == b
    }
}
