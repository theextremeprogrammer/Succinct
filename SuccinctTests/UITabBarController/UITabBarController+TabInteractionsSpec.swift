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
                    .withViewController(withTitle: "X")
                    .build()


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("maintains the first tab selection if the indicated tab title does not match") {
                let tabBarVC = UITabBarControllerBuilder()
                    .withViewController(withTitle: "X")
                    .withViewController(withTitle: "Y")
                    .withViewController(withTitle: "Z")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Home")


                expect(tabBarVC.selectedIndex).to(equal(0))
            }

            it("selects the desired tab when the title text matches") {
                let tabBarVC = UITabBarControllerBuilder()
                    .withViewController(withTitle: "X")
                    .withViewController(withTitle: "Y")
                    .withViewController(withTitle: "Z")
                    .build()


                tabBarVC.selectTab(withExactTitle: "Y")


                expect(tabBarVC.selectedIndex).to(equal(1))


                tabBarVC.selectTab(withExactTitle: "Z")


                expect(tabBarVC.selectedIndex).to(equal(2))
            }
        }
    }
}
