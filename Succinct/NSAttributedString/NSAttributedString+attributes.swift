extension NSAttributedString {
    public func hasAttributes(_ searchAttributes: [NSAttributedString.Key: Any], atSubString substring: String) -> Bool {
        var foundAttributeKeys = [[NSAttributedString.Key: NSRange]]()
        enumerateAttributes(in: NSRange(location: 0, length: length)) { (attributes, range, stop) in
            for attribute in attributes {
                switch attribute.key {
                case .font:
                    guard attribute.value is UIFont else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .backgroundColor:
                    guard attribute.value is UIColor else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .foregroundColor:
                    guard attribute.value is UIColor else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .underlineStyle:
                    guard attribute.value is NSUnderlineStyle else { break }
                    foundAttributeKeys.append([attribute.key: range])

                case .underlineColor:
                    guard attribute.value is UIColor else { break }
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
}
