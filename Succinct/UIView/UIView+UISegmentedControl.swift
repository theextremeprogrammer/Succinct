extension UIView {
    public func hasSegmentedControlSegmentSelected(withExactText searchText: String) -> Bool {
        for subview in subviews {
            if let segmentedControl = subview as? UISegmentedControl {
                let selectedSegmentIndex = segmentedControl.selectedSegmentIndex

                for index in 0..<segmentedControl.numberOfSegments {
                    let segmentTitle = segmentedControl.titleForSegment(at: index)

                    if segmentTitle == searchText && index == selectedSegmentIndex {
                        return true
                    }
                }
            } else if subview.hasSegmentedControlSegmentSelected(withExactText: searchText) {
                return true
            }
        }

        return false
    }

    public func selectSegment(withTitleText searchText: String) {
        for subview in subviews {
            if let segmentedControl = subview as? UISegmentedControl {
                for index in 0..<segmentedControl.numberOfSegments {
                    let segmentTitle = segmentedControl.titleForSegment(at: index)

                    if segmentTitle == searchText {
                        segmentedControl.selectedSegmentIndex = index
                        segmentedControl.sendActions(for: .valueChanged)
                    }
                }
            } else {
                subview.selectSegment(withTitleText: searchText)
            }
        }
    }
}
