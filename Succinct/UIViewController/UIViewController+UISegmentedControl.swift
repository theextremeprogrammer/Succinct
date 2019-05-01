extension UIViewController {
    public func hasSegmentedControlSegmentSelected(withExactText searchText: String) -> Bool {
        return view.hasSegmentedControlSegmentSelected(withExactText: searchText)
    }
    
    public func selectSegment(withTitleText searchText: String) {
        view.selectSegment(withTitleText: searchText)
    }
}
