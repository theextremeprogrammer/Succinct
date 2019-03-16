import Quick
import Nimble
import Succinct

final class UIViewController_UIButton_hasButtonSpec: QuickSpec {
    override func spec() {
        describe("if a view controller has a single button using exact text") {
            context("when no buttons exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beFalse())
                }
            }
            
            context("when button's text does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withExactText: "ABC")).to(beFalse())
                }
            }
            
            context("when a button exists with the expected text in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
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
                    
                    
                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
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
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubview(UIButtonBuilder().withTitleText("Login")
                                                    .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
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
                                                .withSubview(UIButtonBuilder().withTitleText("Login")
                                                    .build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
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


                    expect(viewController.hasButton(withExactText: "Login")).to(beFalse())
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


                    expect(viewController.hasButton(withExactText: "Login")).to(beTrue())
                }
            }

            context("when a button does not exist in a table view's header view") {
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


                    expect(viewController.hasButton(withExactText: "Login")).to(beFalse())
                }
            }
        }
        
        describe("if a view controller has a single button using an image") {
            let catImage = UIImage(assetIdentifier: .obligatoryCatImage)!
            let foliageImage = UIImage(assetIdentifier: .obligatoryFoliageImage)!

            context("when no button exist") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.hasButton(withImage: foliageImage)).to(beFalse())
                }
            }
            
            context("when 'normal' button image does not match") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withImage: foliageImage)).to(beFalse())
                }
            }
            
            context("when button does not have a 'normal' image") {
                it("cannot find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIButtonBuilder().withImage(catImage, for: .highlighted).build()
                        )
                        .build()


                    expect(viewController.hasButton(withImage: foliageImage)).to(beFalse())
                }
            }

            context("when a button exists with the expected image in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(catImage).build())
                        .build()
                    
                    
                    expect(viewController.hasButton(withImage: catImage)).to(beTrue())
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
                    
                    
                    expect(viewController.hasButton(withImage: catImage)).to(beTrue())
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


                    expect(viewController.hasButton(withImage: catImage)).to(beFalse())
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


                    expect(viewController.hasButton(withImage: catImage)).to(beTrue())
                }
            }
        }
    }
}
