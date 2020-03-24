extension UIView {
    @objc public func hasSegmentedControlSegmentSelected(withExactText searchText: String) -> Bool {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition {
                $0.isSegmentedControl(whereSelectedSegmentHasExactText: searchText)
            }
        )
            .isNotNil()
    }

    @objc public func selectSegment(withTitleText searchText: String) {
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
