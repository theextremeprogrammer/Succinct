extension NSAttributedString {
    public func containsExactString(_ searchString: String, withAttributes searchAttributes: [NSAttributedString.Key : Any]) -> Bool {
        let matchingAttributes = findAttributeKeysMatching(searchAttributes, atSubString: searchString)

        return matchingAttributes.count == searchAttributes.count
    }

    fileprivate func findAttributeKeysMatching(
        _ searchAttributes: [NSAttributedString.Key : Any],
        atSubString substring: String
    ) -> [[NSAttributedString.Key : NSRange]] {
        var foundAttributeKeys = [[NSAttributedString.Key : NSRange]]()
        let subStringRange = NSRange(string.range(of: substring)!, in: string)

        enumerateAttributes(in: subStringRange) { (attributes, range, stop) in
            for attribute in attributes {
                let searchValue = searchAttributes[attribute.key]
                let value = attribute.value

                switch attribute.key {

                case .backgroundColor:
                    guard valuesAreEqual(asType: UIColor.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                case .font:
                    guard valuesAreEqual(asType: UIFont.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                case .foregroundColor:
                    guard valuesAreEqual(asType: UIColor.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                case .link:
                    guard valuesAreEqual(asType: String.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                case .underlineColor:
                    guard valuesAreEqual(asType: UIColor.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                case .underlineStyle:
                    guard
                        valuesAreEqual(asType: NSUnderlineStyle.self, a: searchValue, b: value) ||
                        valuesAreEqual(asType: Int.self, a: searchValue, b: value) else { break }
                    foundAttributeKeys.append([attribute.key : range])

                default:
                    break

                }
            }
        }

        return foundAttributeKeys
    }

    fileprivate func valuesAreEqual<T: Equatable>(asType type: T.Type, a maybeA: Any?, b maybeB: Any?) -> Bool {
        guard
            let a = maybeA as? T,
            let b = maybeB as? T else { return false }

        return a == b
    }
}
