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

    ///
    /// Checks if the UITabBarController's `selectedViewController` property matches the type passed in.
    ///
    /// - Note: This API method is helpful to confirm the type of UIViewController object without having to be coupled to whether or not the UIViewController is inside a UINavigationController or not.
    ///
    /// - Parameter viewControllerType: Type of class to compare to the UITabBarController's `selectedViewController` property.
    /// - Returns: A boolean value indicating if the selected tab's class matches or not.
    ///
    public func selectedTab<T>(isAKindOf viewControllerType: T.Type) -> Bool where T: UIViewController {
        if
            let navController = selectedViewController as? UINavigationController,
            let topViewController = navController.topViewController
        {
            return topViewController.isKind(of: viewControllerType)
        }

        if let selectedViewController = selectedViewController {
            return selectedViewController.isKind(of: viewControllerType)
        }

        return false
    }

}
