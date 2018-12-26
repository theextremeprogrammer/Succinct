extension NSAttributedString {
    public func hasAttributes(_ searchAttributes: [NSAttributedString.Key: Any], atSubString substring: String) -> Bool {
        var foundAttributeKeys = [[NSAttributedString.Key: NSRange]]()
        enumerateAttributes(in: NSRange(location: 0, length: length)) { (attributes, range, stop) in
            for attribute in attributes {
                switch attribute.key {
                case .font:
                    guard let value = attribute.value as? UIFont else { break }
                    guard let searchValue = searchAttributes[attribute.key] as? UIFont else { break }
                    if searchValue == value {
                        foundAttributeKeys.append([attribute.key: range])
                    }

                case .backgroundColor:
                    guard let value = attribute.value as? UIColor else { break }
                    guard let searchValue = searchAttributes[attribute.key] as? UIColor else { break }
                    if searchValue == value {
                        foundAttributeKeys.append([attribute.key: range])
                    }

                case .foregroundColor:
                    guard let value = attribute.value as? UIColor else { break }
                    guard let searchValue = searchAttributes[attribute.key] as? UIColor else { break }
                    if searchValue == value {
                        foundAttributeKeys.append([attribute.key: range])
                    }

                case .underlineStyle:
                    guard let value = attribute.value as? NSUnderlineStyle else { break }
                    guard let searchValue = searchAttributes[attribute.key] as? NSUnderlineStyle else { break }
                    if searchValue == value {
                        foundAttributeKeys.append([attribute.key: range])
                    }

                case .underlineColor:
                    guard let value = attribute.value as? UIColor else { break }
                    guard let searchValue = searchAttributes[attribute.key] as? UIColor else { break }
                    if searchValue == value {
                        foundAttributeKeys.append([attribute.key: range])
                    }

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
