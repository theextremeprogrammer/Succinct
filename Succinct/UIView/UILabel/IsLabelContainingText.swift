internal extension UIView {
    func isLabel(containingText searchText: String) -> Bool {
        guard let label = self as? UILabel else {
            return false
        }

        guard let labelText = label.text else {
            return false
        }

        return labelText.contains(searchText)
    }
}
