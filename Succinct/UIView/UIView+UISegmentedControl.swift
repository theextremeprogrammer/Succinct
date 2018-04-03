import UIKit

extension UIView {
    public func hasSegmentedControlSelected(withExactText searchText: String) -> Bool {
        for subview in subviews {
            if let segmentedControl = subview as? UISegmentedControl {
                let selectedSegmentIndex = segmentedControl.selectedSegmentIndex

                for index in 0..<segmentedControl.numberOfSegments {
                    let segmentTitle = segmentedControl.titleForSegment(at: index)

                    if segmentTitle == searchText && index == selectedSegmentIndex {
                        return true
                    }
                }
            } else if subview.subviews.count > 0 {
                if subview.hasSegmentedControlSelected(withExactText: searchText) {
                    return true
                }
            }
        }

        return false
    }
}
