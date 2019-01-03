import UIKit

struct UISegmentedControlBuilder {
    private var segmentedControl: UISegmentedControl

    init() {
        segmentedControl = UISegmentedControl()
    }
    
    func withSegment(titleText: String) -> UISegmentedControlBuilder {
        segmentedControl.insertSegment(
            withTitle: titleText,
            at: segmentedControl.numberOfSegments,
            animated: false
        )

        return self
    }

    func withSelectedSegment(titleText: String) -> UISegmentedControlBuilder {
        segmentedControl.insertSegment(
            withTitle: titleText,
            at: segmentedControl.numberOfSegments,
            animated: false
        )

        segmentedControl.selectedSegmentIndex = segmentedControl.numberOfSegments - 1

        return self
    }

    func build() -> UISegmentedControl {
        return segmentedControl
    }
}
