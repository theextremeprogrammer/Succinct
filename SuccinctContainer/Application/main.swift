import UIKit

func startApplication(delegateClassName: String) {
    _ = UIApplicationMain(
        CommandLine.argc,
        CommandLine.unsafeArgv,
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
