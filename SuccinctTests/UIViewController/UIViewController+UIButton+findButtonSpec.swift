import Quick
import Nimble
import Succinct

final class UIViewController_UIButton_findButtonSpec: QuickSpec {
    override func spec() {
        describe("finding a single button using exact text") {
            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()


                    expect(viewController.findButton(withExactText: "Login")).to(beNil())
                }
            }

            context("when button text does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()


                    expect(viewController.findButton(withExactText: "ABC")).to(beNil())
                }
            }

            context("when a button exists with the expected text in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a button exists with the expected text in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withTitleText("Login").build())
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a button exists with the expected text in a tableview cell") {
                it("can find the button in the first cell") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Account Details",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubview(
                                                    UIButtonBuilder()
                                                        .withTitleText("Login")
                                                        .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }

                it("can find the button in the second cell") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 1, section: 0),
                                        titleLabelText: "Cell Two",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubview(
                                                    UIButtonBuilder()
                                                        .withTitleText("Login")
                                                        .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a table view has no sections") {
                it("cannot find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).to(beNil())
                }
            }

            context("when a button exists in a table view's header view") {
                it("can find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .withSubview(
                                                UIButtonBuilder()
                                                    .withTitleText("Login")
                                                    .build()
                                            )
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a button doesnt exist in a table view's header view") {
                it("cannot find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()


                    let result = viewController.findButton(withExactText: "Login")


                    expect(result).to(beNil())
                }
            }
        }

        describe("finding a single button using an image") {
            let catImage = UIImage(assetIdentifier: .obligatoryCatImage)!
            let foliageImage = UIImage(assetIdentifier: .obligatoryFoliageImage)!

            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()


                    expect(viewController.findButton(withImage: catImage)).to(beNil())
                }
            }

            context("when button image does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()


                    expect(viewController.findButton(withImage: foliageImage)).to(beNil())
                }
            }

            context("when a button exists with the expected image in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }
            }

            context("when a button exists with the expected image in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIButtonBuilder().withImage(catImage).build())
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }
            }

            context("when a button exists with the expected image in a tableview cell") {
                it("can find the button in the first cell") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubview(UIButtonBuilder().withImage(catImage)
                                                    .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()



                    let result = viewController.findButton(withImage: catImage)


                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }

                it("can find the button in the second cell") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 1, section: 0),
                                        titleLabelText: "Cell Two",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubview(UIButtonBuilder().withImage(catImage)
                                                    .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).toNot(beNil())
                    expect(result?.image(for: .normal)).to(equal(catImage))
                }
            }

            context("when a table view has no sections") {
                it("cannot find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .build()
                        )
                        .build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).to(beNil())
                }
            }

            context("when a button exists in a table view's header view") {
                it("can find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .withSubview(
                                                UIButtonBuilder()
                                                    .withImage(catImage)
                                                    .build()
                                            )
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).toNot(beNil())
                }
            }

            context("when a button doesnt exist in a table view's header view") {
                it("cannot find a button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()


                    let result = viewController.findButton(withImage: catImage)


                    expect(result).to(beNil())
                }
            }
        }
    }
}
