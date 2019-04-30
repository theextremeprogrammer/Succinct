import UIKit

extension UITabBarController {
    public func selectTab(withTitle searchTitle: String) {
    public func selectTab(withExactTitle searchTitle: String) {
        if let tabBarItems = tabBar.items {
            for index in 0..<tabBarItems.count {
                let tabBarItem = tabBarItems[index]

                if tabBarItem.title == searchTitle {
                    selectedIndex = index
                    return
                }
            }
        }
    }
}
