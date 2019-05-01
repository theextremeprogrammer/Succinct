extension UINavigationController {
    func hasLabelInNavigationBar(withExactText searchText: String) -> Bool? {
        if view.hasLabel(withExactText: searchText) {
            return true
        }

        if let titleView = navigationItem.titleView, titleView.hasLabel(withExactText: searchText) {
            return true
        }

        return false
    }

    func hasLabelInNavigationBar(containingText searchText: String) -> Bool? {
        if view.hasLabel(containingText: searchText) {
            return true
        }

        if let titleView = navigationItem.titleView, titleView.hasLabel(containingText: searchText) {
            return true
        }

        return false
    }

    func findLabelInNavigationBar(withExactText searchText: String) -> UILabel? {
        if let labelInNavCtrlHierarchy = view.findLabel(withExactText: searchText) {
            return labelInNavCtrlHierarchy
        }

        if let titleView = navigationItem.titleView,
            let labelInTitleView = titleView.findLabel(withExactText: searchText) {

            return labelInTitleView
        }

        return nil
    }

    func findLabelInNavigationBar(containingText searchText: String) -> UILabel? {
        if let labelInNavCtrlHierarchy = view.findLabel(containingText: searchText) {
            return labelInNavCtrlHierarchy
        }

        if let titleView = navigationItem.titleView,
            let labelInTitleView = titleView.findLabel(containingText: searchText) {

            return labelInTitleView
        }

        return nil
    }
}
