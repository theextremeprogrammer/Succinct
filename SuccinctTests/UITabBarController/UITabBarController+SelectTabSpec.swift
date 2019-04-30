import Quick
import Nimble
import Succinct

class UITabBarController_SelectTabSpec: QuickSpec {
    override func spec() {
        describe("selecting the tab of a UITabBarController") {
            it("cannot select the tab if no tabs exist") {
                let tabBarVC = UITabBarController()


                tabBarVC.selectTab(withTitle: "Home")


                expect(tabBarVC.selectedIndex).to(equal(NSNotFound))
            }

            it("selects the first tab by default") {
                let xVC = UIViewController()
                xVC.tabBarItem = UITabBarItem(title: "X", image: nil, selectedImage: nil)

                let tabBarVC = UITabBarController()
                tabBarVC.setViewControllers([xVC], animated: false)


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("maintains the first tab selection if the indicated tab title does not match") {
                let xVC = UIViewController()
                xVC.tabBarItem = UITabBarItem(title: "X", image: nil, selectedImage: nil)

                let yVC = UIViewController()
                yVC.tabBarItem = UITabBarItem(title: "Y", image: nil, selectedImage: nil)

                let zVC = UIViewController()
                zVC.tabBarItem = UITabBarItem(title: "Z", image: nil, selectedImage: nil)

                let tabBarVC = UITabBarController()
                tabBarVC.setViewControllers([xVC, yVC, zVC], animated: false)


                tabBarVC.selectTab(withTitle: "Home")


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("selects the desired tab when the title text matches") {
                let xVC = UIViewController()
                xVC.tabBarItem = UITabBarItem(title: "X", image: nil, selectedImage: nil)

                let yVC = UIViewController()
                yVC.tabBarItem = UITabBarItem(title: "Y", image: nil, selectedImage: nil)

                let zVC = UIViewController()
                zVC.tabBarItem = UITabBarItem(title: "Z", image: nil, selectedImage: nil)

                let tabBarVC = UITabBarController()
                tabBarVC.setViewControllers([xVC, yVC, zVC], animated: false)


                tabBarVC.selectTab(withTitle: "Y")


                expect(tabBarVC.selectedIndex).to(equal(1))


                tabBarVC.selectTab(withTitle: "Z")


                expect(tabBarVC.selectedIndex).to(equal(2))
            }
        }
    }
}
