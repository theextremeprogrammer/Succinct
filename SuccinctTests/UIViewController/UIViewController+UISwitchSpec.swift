import Quick
import Nimble
import Succinct

final class UIViewController_UISwitchSpec: QuickSpec {
    override func spec() {
        describe("finding switches using their on/off status") {
            context("when a switch does not exist in the view hierarchy") {
                it("does not found any switches") {
                    let viewController = UIViewControllerBuilder().build()


                    let switchCount = viewController.countOfSwitches(switchIsOn: true)


                    expect(switchCount).to(equal(0))
                }
            }

            context("when a switch exists in the first subview") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UISwitchBuilder().withIsOn(true).build())
                        .build()


                    let switchCount = viewController.countOfSwitches(switchIsOn: true)


                    expect(switchCount).to(equal(1))
                }
            }

            context("when a switch exists in the second subview") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UISwitchBuilder().withIsOn(true).build())
                                .build()
                        )
                        .build()


                    let switchCount = viewController.countOfSwitches(switchIsOn: true)


                    expect(switchCount).to(equal(1))
                }
            }

            context("when there are switches with different statuses") {
                it("can find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UISwitchBuilder().withIsOn(false).build())
                        .withSubview(UISwitchBuilder().withIsOn(true).build())
                        .build()


                    let switchCount = viewController.countOfSwitches(switchIsOn: false)


                    expect(switchCount).to(equal(1))
                }
            }
        }

        describe("finding a switch when it is contained within a specific view") {
            context("when a switch does not exist") {
                it("does not find the switch when there are no subviews") {
                    let viewController = UIViewControllerBuilder().build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: UIView.self
                    )


                    expect(maybeSwitch).to(beNil())
                }

                it("does not find the switch when there are subviews") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIViewBuilder().build())
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: UIView.self
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            context("when a switch exists, but not within the specified view") {
                final class SomeCustomView: UIView {}

                it("does not find the switch when there are subviews") {
                    let viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UIViewBuilder()
                                .withSubview(UISwitchBuilder().build())
                                .build(),
                            CustomUIViewBuilder<SomeCustomView>().build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: SomeCustomView.self
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            // MARK: - First subview
            context("when a switch exists inside a generic view inside the first subview") {
                final class SomeCustomView: UIView {}

                it("can find the switch when its in the first subview") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            CustomUIViewBuilder<SomeCustomView>()
                                .withSubview(UISwitchBuilder().build())
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: SomeCustomView.self
                    )


                    expect(maybeSwitch).toNot(beNil())
                }

                it("can find the switch when its after another subview") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            CustomUIViewBuilder<SomeCustomView>()
                                .withSubviews(
                                    UIViewBuilder().build(),
                                    UISwitchBuilder().build()
                                )
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: SomeCustomView.self
                    )


                    expect(maybeSwitch).toNot(beNil())
                }
            }

            // MARK: - Second subview
            context("when a switch exists inside a generic view inside the second subview") {
                final class SomeCustomView: UIView {}

                it("can find the switch when its in the second subview") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    CustomUIViewBuilder<SomeCustomView>()
                                        .withSubview(UISwitchBuilder().build())
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: SomeCustomView.self
                    )


                    expect(maybeSwitch).toNot(beNil())
                }

                it("can find the switch when its after another subview") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    CustomUIViewBuilder<SomeCustomView>()
                                        .withSubviews(
                                            UIViewBuilder().build(),
                                            UISwitchBuilder().build()
                                        )
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        containedInView: SomeCustomView.self
                    )


                    expect(maybeSwitch).toNot(beNil())
                }
            }
        }

        describe("finding a switch using a co-located ui label") {
            context("when a switch does not exist") {
                it("does not find the switch") {
                    let viewController = UIViewControllerBuilder().build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            // MARK: - First subview
            context("when a switch exists in the first subview without a uilabel") {
                it("does not find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UISwitchBuilder().withIsOn(true).build())
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            context("when a switch exists in the first subview with a uilabel whose text does not match") {
                it("does not find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UILabelBuilder().withTitleText("ABC").build(),
                            UISwitchBuilder().withIsOn(true).build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            context("when a switch exists in the first subview with a uilabel whose text matches exactly") {
                it("finds the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UILabelBuilder().withTitleText("Option").build(),
                            UISwitchBuilder().withIsOn(true).build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).toNot(beNil())
                    expect(maybeSwitch?.isOn).to(beTrue())
                }
            }

            context("when a switch does not exist in the first subview but a uilabel whose text matches exactly does") {
                it("finds the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Option").build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            // MARK: - Second subview
            context("when a switch exists in the second subview without a uilabel") {
                it("does not find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UISwitchBuilder().withIsOn(true).build())
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            context("when a switch exists in the second subview with a uilabel whose text does not match") {
                it("does not find the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubviews(
                                    UILabelBuilder().withTitleText("ABC").build(),
                                    UISwitchBuilder().withIsOn(true).build()
                                )
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).to(beNil())
                }
            }

            context("when a switch exists in the second subview with a uilabel whose text  matches exactly") {
                it("finds the switch") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubviews(
                                    UILabelBuilder().withTitleText("Option").build(),
                                    UISwitchBuilder().withIsOn(true).build()
                                )
                                .build()
                        )
                        .build()


                    let maybeSwitch = viewController.findSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(maybeSwitch).toNot(beNil())
                    expect(maybeSwitch?.isOn).to(beTrue())
                }
            }
        }
    }
}
