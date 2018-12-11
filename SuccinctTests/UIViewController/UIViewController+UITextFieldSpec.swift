import Quick
import Nimble
import Succinct

final class UIViewController_UITextFieldSpec: QuickSpec {
    override func spec() {
        describe("finding text fields using placeholder text") {
            context("when a UITextField exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextFieldBuilder().withPlaceholderText("Search...").build()
                        )
                        .build()
                }

                it("can find a text field whose placeholder text matches exactly") {
                    expect(viewController.findTextField(withExactPlaceholderText: "Search...")).toNot(beNil())
                }

                it("cannot find a label whose placeholder text does not match exactly") {
                    expect(viewController.findTextField(withExactPlaceholderText: "Search..")).to(beNil())
                }
                
                it("can find a text field whose placeholder text matches partially") {
                    expect(viewController.findTextField(containingPlaceholderText: "Sea")).toNot(beNil())
                }
                
                it("cannot find a label whose placeholder text does not match partially") {
                    expect(viewController.findTextField(containingPlaceholderText: "ABCD")).to(beNil())
                }
            }

            context("when a UITextField exists in the second subview") {
                it("can find a text field whose placeholder text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextFieldBuilder().withPlaceholderText("Search...").build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findTextField(withExactPlaceholderText: "Search...")).toNot(beNil())
                }
            }
        }

        describe("has textfield with placeholder text") {
            context("when a UITextField exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextFieldBuilder().withPlaceholderText("Search...").build()
                        )
                        .build()
                }

                it("can find a text field whose placeholder text matches exactly") {
                    expect(viewController.hasTextField(withExactPlaceholderText: "Search...")).to(beTrue())
                }

                it("cannot find a label whose placeholder text does not match exactly") {
                    expect(viewController.hasTextField(withExactPlaceholderText: "Search..")).to(beFalse())
                }
                
                it("can find a text field whose placeholder text matches partially") {
                    expect(viewController.hasTextField(containingPlaceholderText: "Sea")).to(beTrue())
                }
                
                it("cannot find a label whose placeholder text does not match partially") {
                    expect(viewController.hasTextField(containingPlaceholderText: "ABCD")).to(beFalse())
                }
            }

            context("when a UITextField exists in the second subview") {
                it("has a text field whose placeholder text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextFieldBuilder().withPlaceholderText("Search...").build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasTextField(withExactPlaceholderText: "Search...")).to(beTrue())
                }
            }
        }

        describe("finding text fields with text") {
            context("when a UITextField exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextFieldBuilder().withText("Username").build()
                        )
                        .build()
                }

                it("can find a text field whose text matches exactly") {
                    expect(viewController.findTextField(withExactText: "Username")).toNot(beNil())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.findTextField(withExactText: "Usernam")).to(beNil())
                }

                it("can find a text field whose text matches partially") {
                    expect(viewController.findTextField(containingText: "name")).toNot(beNil())
                }
                
                it("cannot find a label whose text does not match partially") {
                    expect(viewController.findTextField(containingText: "ABCD")).to(beNil())
                }
            }

            context("when a UITextField exists in the second subview") {
                it("can find a text field whose placeholder text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextFieldBuilder().withText("Username").build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findTextField(withExactText: "Username")).toNot(beNil())
                }
            }
        }

        describe("has textfield with text") {
            context("when a UITextField exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITextFieldBuilder().withText("Username").build()
                        )
                        .build()
                }

                it("can find a text field whose text matches exactly") {
                    expect(viewController.hasTextField(withExactText: "Username")).to(beTrue())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.hasTextField(withExactText: "Usernam")).to(beFalse())
                }

                it("can find a text field whose text matches partially") {
                    expect(viewController.hasTextField(containingText: "name")).to(beTrue())
                }
                
                it("cannot find a label whose text does not match partially") {
                    expect(viewController.hasTextField(containingText: "ABCD")).to(beFalse())
                }
            }

            context("when a UITextField exists in the second subview") {
                it("has a text field whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UITextFieldBuilder().withText("Username").build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasTextField(withExactText: "Username")).to(beTrue())
                }
            }
        }
    }
}
