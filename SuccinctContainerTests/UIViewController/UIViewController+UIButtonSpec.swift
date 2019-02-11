import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIButtonSpec: QuickSpec {
    private var buttonWasTapped = false
    private func unitTestButtonWasTapped(_ sender: Any) {
        buttonWasTapped = true
    }
    
    override func spec() {
        describe("button functionality") {
            beforeEach {
                self.buttonWasTapped = false
            }
            
            it("cannot tap a button when no buttons exist") {
                let viewController = UIViewControllerBuilder().build()
                viewController.loadViewControllerForUnitTest()
                
                
                viewController.tapButton(withExactText: "Login")
                
                
                expect(self.buttonWasTapped).to(beFalse())
            }
            
            context("tapping a button with exact text") {
                it("cannot tap a button when the button text does not match") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)
                    
                    let loginButton = UIButtonBuilder()
                        .withTitleText("Login")
                        .withTargetAction(targetAction)
                        .build()
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(loginButton)
                        .build()
                    viewController.loadViewControllerForUnitTest()
                    
                    
                    viewController.tapButton(withExactText: "ABC")
                    
                    
                    expect(self.buttonWasTapped).to(beFalse())
                }
                
                it("can tap a button with exact text") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)
                    
                    let loginButton = UIButtonBuilder()
                        .withTitleText("Login")
                        .withTargetAction(targetAction)
                        .build()
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(loginButton)
                        .build()
                    viewController.loadViewControllerForUnitTest()
                    
                    
                    viewController.tapButton(withExactText: "Login")
                    
                    
                    expect(self.buttonWasTapped).to(beTrue())
                }

                it("can tap a button with exact text inside of a table view cell") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)

                    let loginButton = UIButtonBuilder()
                        .withTitleText("Login")
                        .withTargetAction(targetAction)
                        .build()

                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Action",
                                        selected: false,
                                        subviews: [loginButton]
                                    )
                                )
                                .build()
                        )
                        .build()
                    viewController.loadViewControllerForUnitTest()


                    viewController.tapButton(withExactText: "Login")


                    expect(self.buttonWasTapped).to(beTrue())
                }
            }
            
            context("tapping a button with an image") {
                it("cannot tap a button when the button image does not match") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)
                    
                    let image = UIImage(assetIdentifier: .obligatoryCatImage)!
                    
                    let loginButton = UIButtonBuilder()
                        .withImage(image)
                        .withTargetAction(targetAction)
                        .build()
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(loginButton)
                        .build()
                    viewController.loadViewControllerForUnitTest()
                    
                    
                    viewController.tapButton(withImage: UIImage(assetIdentifier: .obligatoryFoliageImage))
                    
                    
                    expect(self.buttonWasTapped).to(beFalse())
                }

                it("can tap a button with an image") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)
                    
                    let image = UIImage(assetIdentifier: .obligatoryCatImage)!
                    
                    let loginButton = UIButtonBuilder()
                        .withImage(image)
                        .withTargetAction(targetAction)
                        .build()
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(loginButton)
                        .build()
                    viewController.loadViewControllerForUnitTest()
                    
                    
                    viewController.tapButton(withImage: image)
                    
                    
                    expect(self.buttonWasTapped).to(beTrue())
                }

                it("can tap a button with an image inside of a table view cell") {
                    let targetAction = TargetAction(self.unitTestButtonWasTapped)

                    let image = UIImage(assetIdentifier: .obligatoryCatImage)!

                    let loginButton = UIButtonBuilder()
                        .withImage(image)
                        .withTargetAction(targetAction)
                        .build()

                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Action",
                                        selected: false,
                                        subviews: [loginButton]
                                    )
                                )
                                .build()
                        )
                        .build()
                    viewController.loadViewControllerForUnitTest()


                    viewController.tapButton(withImage: image)


                    expect(self.buttonWasTapped).to(beTrue())
                }
            }
        }
    }
}
