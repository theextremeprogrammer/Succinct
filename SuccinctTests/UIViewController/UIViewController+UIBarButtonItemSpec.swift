import UIKit
import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIBarButtonItemSpec: QuickSpec {
    override func spec() {
        describe("finding bar button items") {
            var viewController: UIViewController!
            let emptyTargetAction = TargetAction({_ in })

            context("when there are no bar button items") {
                beforeEach {
                    viewController = UIViewControllerBuilder().build()
                }

                it("cannot find any bar button item specifying a system item") {
                    expect(viewController.hasBarButtonItem(withSystemItem: .add)).to(beFalse())
                }

                it("cannot find any bar button item specifying a title") {
                    expect(viewController.hasBarButtonItem(withTitle: "Login")).to(beFalse())
                }
            }

            context("when there are bar button items but none match what we expect") {
                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withLeftBarButtonItem(systemItem: .add, targetAction: emptyTargetAction)
                        .withRightBarButtonItem(title: "New", targetAction: emptyTargetAction)
                        .build()
                }

                it("cannot find any bar button item specifying a system item") {
                    expect(viewController.hasBarButtonItem(withSystemItem: .stop)).to(beFalse())
                }

                it("cannot find any bar button item specifying a title") {
                    expect(viewController.hasBarButtonItem(withTitle: "Login")).to(beFalse())
                }
            }

            describe("finding bar button items") {
                context("when there is just one bar button item") {
                    it("can find the left bar button item with a system item") {
                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(systemItem: .add, targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withSystemItem: .add)).to(beTrue())
                    }

                    it("can find the left bar button item with a title") {
                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(title: "Add", targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withTitle: "Add")).to(beTrue())
                    }

                    it("can find the right bar button item with a system item") {
                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(systemItem: .add, targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withSystemItem: .add)).to(beTrue())
                    }

                    it("can find the right bar button item with a title") {
                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(title: "Add", targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withTitle: "Add")).to(beTrue())
                    }
                }

                context("when there are multiple bar button items") {
                    it("can find the left bar button item with a system item") {
                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(systemItem: .add, targetAction: emptyTargetAction)
                            .withLeftBarButtonItem(systemItem: .camera, targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withSystemItem: .add)).to(beTrue())
                        expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beTrue())
                    }

                    it("can find the left bar button item with a title") {
                        let viewController = UIViewControllerBuilder()
                            .withLeftBarButtonItem(title: "Add", targetAction: emptyTargetAction)
                            .withLeftBarButtonItem(title: "Camera", targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withTitle: "Add")).to(beTrue())
                        expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beTrue())
                    }

                    it("can find the right bar button item with a system item") {
                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(systemItem: .add, targetAction: emptyTargetAction)
                            .withRightBarButtonItem(systemItem: .camera, targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withSystemItem: .add)).to(beTrue())
                        expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beTrue())
                    }

                    it("can find the right bar button item with a title") {
                        let viewController = UIViewControllerBuilder()
                            .withRightBarButtonItem(title: "Add", targetAction: emptyTargetAction)
                            .withLeftBarButtonItem(title: "Camera", targetAction: emptyTargetAction)
                            .build()


                        expect(viewController.hasBarButtonItem(withTitle: "Add")).to(beTrue())
                        expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beTrue())
                    }
                }

                describe("findping bar button items within a toolbar") {
                    context("when there is no UIToolbar view") {
                        it("cannot find the bar button item") {
                            let viewController = UIViewControllerBuilder()
                                .withSubview(UIViewBuilder().build())
                                .build()


                            expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beFalse())
                            expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beFalse())
                        }
                    }

                    context("When there is a toolbar without any UIBarButtonItems") {
                        it("cannot find the bar button item") {
                            let viewController = UIViewControllerBuilder()
                                .withSubview(UIToolbarBuilder().build())
                                .build()


                            expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beFalse())
                            expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beFalse())
                        }
                    }

                    context("When there is no matching UIBarButtonItem") {
                        it("cannot find the bar button item") {
                            let toolbar = UIToolbarBuilder()
                                .withBarButtonItem(systemItem: .done, targetAction: emptyTargetAction)
                                .withBarButtonItem(title: "Done", targetAction: emptyTargetAction)
                                .build()

                            let viewController = UIViewControllerBuilder()
                                .withSubview(toolbar)
                                .build()


                            expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beFalse())
                            expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beFalse())
                        }
                   }

                    context("when the toolbar is configured in a text view") {
                        it("can find the bar button item") {
                            let toolbar = UIToolbarBuilder()
                                .withBarButtonItem(systemItem: .camera, targetAction: emptyTargetAction)
                                .withBarButtonItem(title: "Camera", targetAction: emptyTargetAction)
                                .build()

                            let viewController = UIViewControllerBuilder()
                                .withSubview(toolbar)
                                .build()


                            expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beTrue())
                            expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beTrue())
                        }
                    }

                    context("when the toolbar is in the second subview") {
                        it("can find the bar button item") {
                            let toolbar = UIToolbarBuilder()
                                .withBarButtonItem(systemItem: .camera, targetAction: emptyTargetAction)
                                .withBarButtonItem(title: "Camera", targetAction: emptyTargetAction)
                                .build()

                            let viewController = UIViewControllerBuilder()
                                .withSubview(
                                    UIViewBuilder()
                                        .withSubview(toolbar)
                                        .build()
                                )
                                .build()


                            expect(viewController.hasBarButtonItem(withSystemItem: .camera)).to(beTrue())
                            expect(viewController.hasBarButtonItem(withTitle: "Camera")).to(beTrue())
                        }
                    }
                }
            }
        }
    }
}
