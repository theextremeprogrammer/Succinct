extension NSObject {
    internal var memoryAddress: String {
        get {
            return String(format: "%p", self)
        }
    }
}
