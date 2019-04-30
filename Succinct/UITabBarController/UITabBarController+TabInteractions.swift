import UIKit

extension UITabBarController {
    ///
    /// Attempts to select a tab in a UITabBarController whose UITabBarItem `title` property matches the searchTitle text.
    ///
    /// - Parameter searchTitle: Text to compare to the title text of any UITabBarItem objects that are found.
    ///
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
