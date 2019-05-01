extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIImageView object whose image matches the provided search image.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: A boolean value indicating if a UIImageView was found or not.
    ///
    public func hasImageView(withImage searchImage: UIImage) -> Bool {
        return view.hasImageView(withImage: searchImage)
    }
    
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIImageView object whose image matches the provided search image.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIImageView, if one is found.
    ///
    public func findImageView(withImage searchImage: UIImage) -> UIImageView? {
        return view.findImageView(withImage: searchImage)
    }
    
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for all UIImageView objects whose image matches the provided search image.
    ///
    /// - Returns: The total number of matching UIImageView objects.
    ///
    public func countOfImages(_ searchImage: UIImage) -> Int {
        return view.countOfImages(searchImage)
    }
}
