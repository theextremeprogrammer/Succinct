import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIBarButtonItemSpec: QuickSpec {
    private var firstButtonWasTapped: Bool = false
    private var secondButtonWasTapped: Bool = false

    private func didTapFirstBarButtonItem(_ sender: Any) {
        firstButtonWasTapped = true
    }

    private func didTapSecondBarButtonItem(_sender: Any) {
        secondButtonWasTapped = true
    }

    override func spec() {
        describe("tapping bar button items") {
            var viewController: UIViewController!

            beforeEach {
                self.firstButtonWasTapped = false
                self.secondButtonWasTapped = false
            }

            context("when there are no bar button items") {
                beforeEach {
                    viewController = UIViewControllerBuilder().build()
                }

                it("cannot tap any bar button item specifying a system item") {
                    viewController.tapBarButtonItem(withSystemItem: .add)


                    expect(self.firstButtonWasTapped).to(beFalse())
                }

                it("cannot tap any bar button item specifying a title") {
                    viewController.tapBarButtonItem(withTitle: "Login")


                    expect(self.firstButtonWasTapped).to(beFalse())
                }

                it("cannot tap the left bar button item") {
                    viewController.tapLeftBarButtonItem()


                    expect(self.firstButtonWasTapped).to(beFalse())
                }

                it("cannot tap the right bar button item") {
                    viewController.tapRightBarButtonItem()


                    expect(self.firstButtonWasTapped).to(beFalse())
                }
            }

            context("when there are bar button items but none match what we expect") {
                beforeEach {
                    let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                    viewController = UIViewControllerBuilder()
                        .withLeftBarButtonItem(systemItem: .add, targetAction: targetAction)
                        .withRightBarButtonItem(title: "New", targetAction: targetAction)
                        .build()
                }

                it("cannot tap any bar button item specifying a system item") {
                    viewController.tapBarButtonItem(withSystemItem: .stop)


                    expect(self.firstButtonWasTapped).to(beFalse())
                }

                it("cannot tap any bar button item specifying a title") {
                    viewController.tapBarButtonItem(withTitle: "Login")


                    expect(self.firstButtonWasTapped).to(beFalse())
                }
            }

            describe("tapping bar button items") {
                it("can tap the left bar button item") {
                    let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withLeftBarButtonItem(title: "Add", targetAction: targetAction)
                        .build()


                    viewController.tapLeftBarButtonItem()


                    expect(self.firstButtonWasTapped).to(beTrue())
                }

                it("can tap the right bar button item") {
                    let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                    let viewController = UIViewControllerBuilder()
                        .withRightBarButtonItem(title: "Add", targetAction: targetAction)
                        .build()


                    viewController.tapRightBarButtonItem()


                    expect(self.firstButtonWasTapped).to(beTrue())
                }
            }

            describe("tapping system bar button items") {
                context("when there is only one bar button item") {
                    beforeEach {
                        expect(self.firstButtonWasTapped).to(beFalse())
                    }

                    it("can tap the *left* bar button item matching the specified system item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(systemItem: .add, targetAction: targetAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .add)


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }

                    it("can tap the *right* bar button item matching the specified system item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(systemItem: .camera, targetAction: targetAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }
                }

                context("when there are multiple bar button items") {
                    it("can tap the first *left* bar button item matching the specified system item") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(systemItem: .add, targetAction: firstAction)
                            .withLeftBarButtonItem(systemItem: .camera, targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .add)


                        expect(self.firstButtonWasTapped).to(beTrue())
                        expect(self.secondButtonWasTapped).to(beFalse())
                    }

                    it("can tap the second *left* bar button item matching the specified system item") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(systemItem: .add, targetAction: firstAction)
                            .withLeftBarButtonItem(systemItem: .camera, targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beFalse())
                        expect(self.secondButtonWasTapped).to(beTrue())
                    }

                    it("can tap the first *right* bar button item matching the specified system item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)
                        let otherAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(systemItem: .add, targetAction: targetAction)
                            .withRightBarButtonItem(systemItem: .camera, targetAction: otherAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .add)


                        expect(self.firstButtonWasTapped).to(beTrue())
                        expect(self.secondButtonWasTapped).to(beFalse())
                    }

                    it("can tap the second *right* bar button item matching the specified system item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)
                        let otherAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(systemItem: .add, targetAction: targetAction)
                            .withRightBarButtonItem(systemItem: .camera, targetAction: otherAction)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beFalse())
                        expect(self.secondButtonWasTapped).to(beTrue())
                    }
                }
            }

            describe("tapping bar button items with a title") {
                context("when there is only one bar button item") {
                    beforeEach {
                        expect(self.firstButtonWasTapped).to(beFalse())
                    }

                    it("can tap the *left* bar button item matching the specified title") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(title: "Add", targetAction: targetAction)
                            .build()


                        viewController.tapLeftBarButtonItem()


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }

                    it("can tap the *right* bar button item matching the specified title") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(title: "Add", targetAction: targetAction)
                            .build()


                        viewController.tapRightBarButtonItem()


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }
                }

                context("when there are multiple bar button items") {
                    it("can tap the *first* left bar button item matching the specified title") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(title: "Add", targetAction: firstAction)
                            .withLeftBarButtonItem(title: "Camera", targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withTitle: "Add")


                        expect(self.firstButtonWasTapped).to(beTrue())
                        expect(self.secondButtonWasTapped).to(beFalse())
                    }

                    it("can tap the *second* left bar button item matching the specified title") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(title: "Add", targetAction: firstAction)
                            .withLeftBarButtonItem(title: "Camera", targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withTitle: "Camera")


                        expect(self.secondButtonWasTapped).to(beTrue())
                        expect(self.firstButtonWasTapped).to(beFalse())
                    }

                    it("can tap the *first* right bar button item matching the specified title") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(title: "Add", targetAction: firstAction)
                            .withRightBarButtonItem(title: "Camera", targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withTitle: "Add")


                        expect(self.firstButtonWasTapped).to(beTrue())
                        expect(self.secondButtonWasTapped).to(beFalse())
                    }

                    it("can tap the *second* right bar button item matching the specified title") {
                        let firstAction = TargetAction(self.didTapFirstBarButtonItem)
                        let secondAction = TargetAction(self.didTapSecondBarButtonItem)

                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(title: "Add", targetAction: firstAction)
                            .withRightBarButtonItem(title: "Camera", targetAction: secondAction)
                            .build()


                        viewController.tapBarButtonItem(withTitle: "Camera")


                        expect(self.secondButtonWasTapped).to(beTrue())
                        expect(self.firstButtonWasTapped).to(beFalse())
                    }
                }
            }
            
            describe("tapping bar button items within a toolbar") {
                context("when there is no UIToolbar view") {
                    it("cannot tap the bar button item") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIViewBuilder().build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beFalse())
                    }
                }

                context("When there is a toolbar without any UIBarButtonItems") {
                    it("cannot tap the bar button item") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIToolbarBuilder().build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beFalse())
                    }
                }

                context("When there is no matching UIBarButtonItem") {
                    it("cannot tap the bar button item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .done, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(toolbar)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beFalse())
                    }
                }

                context("when the toolbar is configured in a text view") {
                    it("can tap the bar button item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .camera, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(toolbar)
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }
                }

                context("when the toolbar is in the second subview") {
                    it("can tap the bar button item") {
                        let targetAction = TargetAction(self.didTapFirstBarButtonItem)

                        let toolbar = UIToolbarBuilder()
                            .withBarButtonItem(systemItem: .camera, targetAction: targetAction)
                            .build()

                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIViewBuilder().withSubview(toolbar).build())
                            .build()


                        viewController.tapBarButtonItem(withSystemItem: .camera)


                        expect(self.firstButtonWasTapped).to(beTrue())
                    }
                }
            }
        }
    }
}
