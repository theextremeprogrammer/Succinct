import UIKit

internal protocol ViewHierarchyLogger {
    func logEnterParentView(_ view: UIView)
    func logExitParentView(_ view: UIView)

    func logEnterChildView(_ view: UIView)
    func logExitChildView(_ view: UIView)
}

internal class DefaultViewHierarchyLogger {
    private var currentDepthLevel: Int

    public init() {
        currentDepthLevel = 1
    }
}

extension DefaultViewHierarchyLogger: ViewHierarchyLogger {
    public func logEnterParentView(_ view: UIView) {
        if (currentDepthLevel == 1) {
            let viewAsString = String(describing: type(of: view))
            Succinct.log.debug("\(indentation)<\(viewAsString)>")
        }
    }

    public func logExitParentView(_ view: UIView) {
        if (currentDepthLevel == 1) {
            let viewAsString = String(describing: type(of: view))
            Succinct.log.debug("\(indentation)</\(viewAsString)>")
        }
    }

    public func logEnterChildView(_ view: UIView) {
        incrementDepthLevel()

        let viewAsString = String(describing: type(of: view))
        Succinct.log.debug("\(indentation)<\(viewAsString)>")
    }

    public func logExitChildView(_ view: UIView) {
        let viewAsString = String(describing: type(of: view))
        Succinct.log.debug("\(indentation)</\(viewAsString)>")

        decrementDepthLevel()
    }
}

fileprivate extension DefaultViewHierarchyLogger {
    var indentation: String {
        get {
            return String(repeating: " ", count: currentDepthLevel * 4)
        }
    }

    func incrementDepthLevel() {
        currentDepthLevel += 1
    }

    func decrementDepthLevel() {
        currentDepthLevel -= 1
    }
}
