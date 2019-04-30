import Quick
import Nimble
import Succinct

class UITabBarController_TabInteractionsSpec: QuickSpec {
    override func spec() {
        describe("selecting the tab of a UITabBarController") {
            it("cannot select the tab if no tabs exist") {
                let tabBarVC = UITabBarControllerBuilder().build()


                tabBarVC.selectTab(withExactTitle: "Home")


                expect(tabBarVC.selectedIndex).to(equal(NSNotFound))
            }

            it("selects the first tab by default") {
                let tabBarVC = UITabBarControllerBuilder()
                    .withGenericViewController(withTitle: "X")
                    .build()


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("maintains the first tab selection if the indicated tab title does not match") {
                let tabBarVC = UITabBarControllerBuilder()
                    .withGenericViewController(withTitle: "X")
                    .withGenericViewController(withTitle: "Y")
                    .withGenericViewController(withTitle: "Z")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Home")


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("selects the desired tab when the title text matches") {
                let tabBarVC = UITabBarControllerBuilder()
                    .withGenericViewController(withTitle: "X")
                    .withGenericViewController(withTitle: "Y")
                    .withGenericViewController(withTitle: "Z")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Y")


                expect(tabBarVC.selectedIndex).to(equal(1))


                tabBarVC.selectTab(withExactTitle: "Z")


                expect(tabBarVC.selectedIndex).to(equal(2))
            }
        }

        final class XViewController: UIViewController {}
        final class YViewController: UIViewController {}

        describe("checking the displayed tab's view controller class") {
            it("returns false when there are no tabs") {
                let tabBarVC = UITabBarControllerBuilder().build()


                expect(tabBarVC.selectedTab(isAKindOf: UIViewController.self)).to(beFalse())
            }

            it("returns true when the selected tab's view controller is the tab that is displayed") {
                let xVC = XViewController()
                let yVC = YViewController()

                let tabBarVC = UITabBarControllerBuilder()
                    .withViewController(xVC, withTitle: "X")
                    .withViewController(yVC, withTitle: "Y")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Y")


                expect(tabBarVC.selectedTab(isAKindOf: YViewController.self)).to(beTrue())
            }

            it("returns true when the selected tab's view controller is a UINavigationController that contains the requested type") {
                let xVC = XViewController()
                let yVC = YViewController()
                let yNavController = UINavigationController(rootViewController: yVC)

                let tabBarVC = UITabBarControllerBuilder()
                    .withViewController(xVC, withTitle: "X")
                    .withViewController(yNavController, withTitle: "Y")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Y")


                expect(tabBarVC.selectedTab(isAKindOf: YViewController.self)).to(beTrue())
            }

            it("returns false when the navigation controller has no topViewController") {
                let xVC = XViewController()
                let navController = UINavigationController(nibName: nil, bundle: nil)

                let tabBarVC = UITabBarControllerBuilder()
                    .withViewController(xVC, withTitle: "X")
                    .withViewController(navController, withTitle: "Y")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Y")


                expect(tabBarVC.selectedTab(isAKindOf: YViewController.self)).to(beFalse())
            }
        }
    }
}
