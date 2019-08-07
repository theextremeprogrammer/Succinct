extension UIViewController {
    @objc public func hasSegmentedControlSegmentSelected(withExactText searchText: String) -> Bool {
        return view.hasSegmentedControlSegmentSelected(withExactText: searchText)
    }
    
    @objc public func selectSegment(withTitleText searchText: String) {
        view.selectSegment(withTitleText: searchText)
    }
}
