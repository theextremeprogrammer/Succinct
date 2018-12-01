import UIKit

extension UINavigationController {
    func hasLabelInNavigationBar(withExactText searchText: String) -> Bool? {
        if let titleView = self.navigationItem.titleView, titleView.hasLabel(withExactText: searchText) {
            return true
        }

        if self.view.hasLabel(withExactText: searchText) {
            return true
        }

        return false
    }

    func hasLabelInNavigationBar(containingText searchText: String) -> Bool? {
        if let titleView = self.navigationItem.titleView, titleView.hasLabel(containingText: searchText) {
            return true
        }

        if self.view.hasLabel(containingText: searchText) {
            return true
        }

        return false
    }

    func findLabelInNavigationBar(withExactText searchText: String) -> UILabel? {
        if  let titleView = self.navigationItem.titleView,
            let labelInTitleView = titleView.findLabel(withExactText: searchText) {

            return labelInTitleView
        }


        if let labelInNavCtrlHierarchy = self.view.findLabel(withExactText: searchText) {
            return labelInNavCtrlHierarchy
        }

        return nil
    }

    func findLabelInNavigationBar(containingText searchText: String) -> UILabel? {
        if  let titleView = self.navigationItem.titleView,
            let labelInTitleView = titleView.findLabel(containingText: searchText) {

            return labelInTitleView
        }


        if let labelInNavCtrlHierarchy = self.view.findLabel(containingText: searchText) {
            return labelInNavCtrlHierarchy
        }

        return nil
    }
}
