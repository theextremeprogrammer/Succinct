import UIKit

func startApplication(delegateClassName: String) {
    UIApplicationMain(
        CommandLine.argc,
        UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
        NSStringFromClass(UIApplication.self),
        delegateClassName
    )
}

class TestingAppDelegate: UIApplication, UIApplicationDelegate {}

if NSClassFromString("XCTestCase") != nil {
    startApplication(delegateClassName: NSStringFromClass(TestingAppDelegate.self))
} else {
    startApplication(delegateClassName: NSStringFromClass(AppDelegate.self))
}
