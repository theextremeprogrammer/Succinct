///
/// Definition for a closure that takes a UIView as an argument in order to evaluates it against some kind of condition. If a UIView object that satisfies this conditio is found, then that UIView object is returned.
///
/// - Parameter viewToEvaluate: The UIView object to evaluate against a condition.
/// - Returns: An optional UIView that matches the provided criteria, if one is found.
///
public typealias UIViewEvaluator = (_ viewToEvaluate: UIView) -> UIView?

extension UITableView {
    ///
    /// Searches through all rows of all sections as well as all header views within a UITableView for a view that satisfies the passed in condition.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter satisfyingCondition: A UIViewEvaluator closure that takes a UIView as an argument and evaluates it against some kind of condition and returns an optional UIView if a view is found that matches the condition.
    /// - Returns: An optional UIView, if one is found.
    ///
    public func findView(satisfyingCondition: UIViewEvaluator) -> UIView? {
        for section in 0..<numberOfSections {
            if let headerView = delegate?.tableView?(self, viewForHeaderInSection: section) {
                if let view = satisfyingCondition(headerView) {
                    return view
                }
            }
            
            let numberOfItems = numberOfRows(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let cell = dataSource?.tableView(self, cellForRowAt: indexPath) {
                    if let view = satisfyingCondition(cell) {
                        return view
                    }
                }
            }
        }

        return nil
    }
}
