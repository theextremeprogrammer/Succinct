struct AttributedStringSearchPair<T> {
    let value: T
    let searchValue: T
}

extension NSAttributedString {
    public func hasAttributes(_ searchAttributes: [NSAttributedString.Key: Any], atSubString substring: String) -> Bool {
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

        guard let range = string.range(of: substring) else { return false }
        let rangeOfSearchText = NSRange(range, in: substring)

        var matchingAttributes = [NSAttributedString.Key]()
        for attributes in foundAttributeKeys {
            for attribute in attributes {
                if rangeOfSearchText == attribute.value {
                    matchingAttributes.append(attribute.key)
                }
            }
        }

        if matchingAttributes.count == searchAttributes.count {
            return true
        }

        return false
    }

    func valuesAreEqual<T: Equatable>(asType type: T.Type, a: Any?, b: Any?) -> Bool {
        guard let a = a as? T, let b = b as? T else { return false }

        return a == b
    }
}
