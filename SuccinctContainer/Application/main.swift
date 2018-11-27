import UIKit

func startApplication(delegateClassName: String) {
    let _ = UIApplicationMain(
        CommandLine.argc,
        UnsafeMutableRawPointer(CommandLine.unsafeArgv).bindMemory(to: UnsafeMutablePointer<Int8>.self, capacity: Int(CommandLine.argc)),
        NSStringFromClass(UIApplication.self),
        delegateClassName
    )
}

final class TestingAppDelegate: UIApplication, UIApplicationDelegate {}

if NSClassFromString("XCTestCase") != nil {
    startApplication(delegateClassName: NSStringFromClass(TestingAppDelegate.self))
} else {
    startApplication(delegateClassName: NSStringFromClass(AppDelegate.self))
}
