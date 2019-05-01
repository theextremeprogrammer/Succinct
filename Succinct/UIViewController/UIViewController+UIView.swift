extension UIViewController {
    public func hasView(withBackgroundColor searchColor: UIColor) -> Bool {
        return view.hasView(withBackgroundColor: searchColor)
    }
    
    public func countOfViews(withBackgroundColor searchColor: UIColor) -> Int {
        return view.countOfViews(withBackgroundColor: searchColor)
    }
}
