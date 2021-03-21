extension UIView {
    internal func findInSubviews(
        satisfyingCondition condition: SuccinctCondition,
        viewHierarchyLogger: ViewHierarchyLogger = DefaultViewHierarchyLogger()
    ) -> UIView? {
        viewHierarchyLogger.logEnterParentView(self)

        if (condition.evaluate(self)) {
            return self
        }

        if let view = isTableView(thatSatisfiesCondition: condition) {
            return view
        }

        for subview in subviews {
            viewHierarchyLogger.logEnterChildView(subview)

            if condition.evaluate(subview) {
                return subview
            }

            if let view = subview.isTableView(thatSatisfiesCondition: condition) {
                return view
            }

            if let view = subview.containsSubview(
                thatSatisfiesCondition: condition,
                viewHierarchyLogger: viewHierarchyLogger
            ) {
                return view
            }

            viewHierarchyLogger.logExitChildView(subview)
        }

        viewHierarchyLogger.logExitParentView(self)

        return nil
    }

    internal func filterSubviews(
        satisfyingCondition condition: SuccinctCondition,
        viewHierarchyLogger: ViewHierarchyLogger = DefaultViewHierarchyLogger()
    ) -> [UIView] {
        var discoveredViews: [UIView] = []

        for subview in subviews {
            if condition.evaluate(subview) {
                discoveredViews.append(subview)
            }

            if subview.isNotATypeThatContainsAnInfiniteNumberOfSubviews {
                if subview.subviews.count > 0 {
                    discoveredViews.append(contentsOf:
                        subview.filterSubviews(
                            satisfyingCondition: condition,
                            viewHierarchyLogger: viewHierarchyLogger
                        )
                    )
                }
            }
        }

        return discoveredViews
    }
}

fileprivate extension UIView {
    func isTableView(thatSatisfiesCondition condition: SuccinctCondition) -> UIView? {
        if let tableView = self as? UITableView {
            if let view = tableView.findView(
                satisfyingCondition: { $0.findInSubviews(satisfyingCondition: condition) }
            ) {
                return view
            }
        }

        return nil
    }

    private func containsSubview(
        thatSatisfiesCondition condition: SuccinctCondition,
        viewHierarchyLogger: ViewHierarchyLogger
    ) -> UIView? {
        if isNotATypeThatContainsAnInfiniteNumberOfSubviews {
            if subviews.count > 0 {
                if let view = findInSubviews(
                    satisfyingCondition: condition,
                    viewHierarchyLogger: viewHierarchyLogger
                ) {
                    return view
                }
            }
        }

        return nil
    }
}
