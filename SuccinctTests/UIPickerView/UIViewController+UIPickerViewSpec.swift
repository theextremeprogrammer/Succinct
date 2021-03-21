import Quick
import Nimble
import Succinct

class UIViewControllerUIPickerViewSpec: QuickSpec {
    override func spec() {
        describe("has UIPickerView") {
            var viewController: UIViewController!
            
            context("when a picker does not exist") {
                it("cannot find the picker view") {
                    viewController = UIViewControllerBuilder().build()
                    
                    
                    expect(viewController.hasPickerView()).to(beFalse())
                }
            }
            
            context("when a picker exists in the first subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(UIPickerViewBuilder().build())
                        .build()
                    
                    
                    expect(viewController.hasPickerView()).to(beTrue())
                }
            }
            
            context("when a picker exists in the second subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIPickerViewBuilder().build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.hasPickerView()).to(beTrue())
                }
            }
        }

        describe("finding UIPickerView") {
            var viewController: UIViewController!
            
            context("when a picker does not exist") {
                it("cannot find the picker view") {
                    viewController = UIViewControllerBuilder().build()


                    expect(viewController.findPickerView()).to(beNil())
                }
            }

            context("when a picker exists in the first subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(UIPickerViewBuilder().build())
                        .build()
                    
                    
                    expect(viewController.findPickerView()).toNot(beNil())
                }
            }

            context("when a picker exists in the second subview") {
                it("can find the picker view") {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIPickerViewBuilder().build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.findPickerView()).toNot(beNil())
                }
            }
        }
    }
}
