import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIBarButtonItemSpec: QuickSpec {
    private var buttonWasTapped: Bool = false

    private func didTapBarButtonItem(_ sender: Any) {
        buttonWasTapped = true
    }

    override func spec() {
        describe("tapping bar button items") {
            var viewController: UIViewController!

            beforeEach {
                self.buttonWasTapped = false
            }

            context("when there are no bar button items") {
                beforeEach {
                    viewController = UIViewControllerBuilder().build()
                }

                it("cannot tap any bar button item") {
                    viewController.tapBarButtonItem(withSystemItem: .add)


                    expect(self.buttonWasTapped).to(beFalse())
                }

                it("cannot tap the left bar button item") {
                    viewController.tapLeftBarButtonItem()


                    expect(self.buttonWasTapped).to(beFalse())
                }

                it("cannot tap the right bar button item") {
                    viewController.tapRightBarButtonItem()


                    expect(self.buttonWasTapped).to(beFalse())
                }
            }

            describe("tapping system bar button items") {
                it("can tap the *left* bar button item matching the specified system item") {
                    let targetAction = TargetAction(self.didTapBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withLeftBarButtonItem(systemItem: .add, targetAction: targetAction)
                        .build()


                    viewController.tapBarButtonItem(withSystemItem: .add)


                    expect(self.buttonWasTapped).to(beTrue())
                }

                it("can tap the *right* bar button item matching the specified system item") {
                    let targetAction = TargetAction(self.didTapBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withRightBarButtonItem(systemItem: .camera, targetAction: targetAction)
                        .build()


                    viewController.tapBarButtonItem(withSystemItem: .camera)


                    expect(self.buttonWasTapped).to(beTrue())
                }
            }

            describe("explicitly tapping the left bar button item that is not a system item") {
                it("can tap the left bar button item") {
                    let targetAction = TargetAction(self.didTapBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withLeftBarButtonItem(title: "Add", targetAction: targetAction)
                        .build()


                    viewController.tapLeftBarButtonItem()


                    expect(self.buttonWasTapped).to(beTrue())
                }
            }

            describe("explicitly tapping the right bar button item that is not a system item") {
                it("can tap the right bar button item") {
                    let targetAction = TargetAction(self.didTapBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withRightBarButtonItem(title: "Add", targetAction: targetAction)
                        .build()


                    viewController.tapRightBarButtonItem()


                    expect(self.buttonWasTapped).to(beTrue())
                }
            }
            
            describe("tapping bar button items within a toolbar") {
                context("when there is no UIToolbar view") {
                    it("cannot tap the bar button item") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIViewBuilder().build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.buttonWasTapped).to(beFalse())
                    }
                }

                context("When there is a toolbar without any UIBarButtonItems") {
                    it("cannot tap the bar button item") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIToolbarBuilder().build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.buttonWasTapped).to(beFalse())
                    }
                }

                context("When there is no matching UIBarButtonItem") {
                    it("cannot tap the bar button item") {
                        let targetAction = TargetAction(self.didTapBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .done, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(toolbar)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.buttonWasTapped).to(beFalse())
                    }
                }

                context("when the toolbar is configured in a text view") {
                    it("can tap the bar button item") {
                        let targetAction = TargetAction(self.didTapBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .camera, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(toolbar)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.buttonWasTapped).to(beTrue())
                    }
                }

                context("when the toolbar is in the second subview") {
                    it("can tap the bar button item") {
                        let targetAction = TargetAction(self.didTapBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .camera, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIViewBuilder().withSubview(toolbar).build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.buttonWasTapped).to(beTrue())
                    }
                }
            }
        }
    }
}
