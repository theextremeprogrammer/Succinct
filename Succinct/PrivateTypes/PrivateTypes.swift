class PrivateTypes {
    private struct Constants {
        struct ClassName {
            static let UISegmentLabel: String = "UISegmentLabel"
        }
    }

    static var UISegmentLabel: AnyClass {
        get {
            return NSClassFromString(Constants.ClassName.UISegmentLabel)!
        }
    }
}
