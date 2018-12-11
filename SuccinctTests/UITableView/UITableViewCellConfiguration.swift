import UIKit

struct UITableViewCellConfiguration {
    let indexPath: IndexPath
    let titleLabelText: String
    let selected: Bool
    let subviews: [UIView]
}

struct UITableViewHeaderConfiguration {
    let section: Int
    let view: UIView?
}
