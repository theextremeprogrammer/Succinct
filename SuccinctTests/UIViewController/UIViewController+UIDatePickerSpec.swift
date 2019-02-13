import Quick
import Nimble
import Succinct

class UIViewControllerUIDatePickerViewSpec: QuickSpec {
    override func spec() {
        describe("has UIDatePickerView") {
            var viewController: UIViewController!

            context("when a picker does not exist") {
                it("cannot find the picker view") {
                    viewController = UIViewControllerBuilder().build()


                    expect(viewController.hasDatePickerView()).to(beFalse())
                }
            }

            context("when a picker exists in the first subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(UIDatePickerViewBuilder().build())
                        .build()


                    expect(viewController.hasDatePickerView()).to(beTrue())
                }
            }

            context("when a picker exists in the second subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIDatePickerViewBuilder().build())
                                .build()
                        )
                        .build()


                    expect(viewController.hasDatePickerView()).to(beTrue())
                }
            }
        }

        describe("finding UIDatePickerView") {
            var viewController: UIViewController!

            context("when a picker does not exist") {
                it("cannot find the picker view") {
                    viewController = UIViewControllerBuilder().build()


                    expect(viewController.findDatePickerView()).to(beNil())
                }
            }

            context("when a picker exists in the first subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(UIDatePickerViewBuilder().build())
                        .build()


                    expect(viewController.findDatePickerView()).toNot(beNil())
                }
            }

            context("when a picker exists in the second subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIDatePickerViewBuilder().build())
                                .build()
                        )
                        .build()


                    expect(viewController.findDatePickerView()).toNot(beNil())
                }
            }
        }
    }
}
