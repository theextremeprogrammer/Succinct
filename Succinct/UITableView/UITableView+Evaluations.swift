import UIKit

extension UITableView {
    public func findView(satisfyingCondition: (UIView) -> UIView?) -> UIView? {
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
