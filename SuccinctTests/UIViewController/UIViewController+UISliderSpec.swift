import Quick
import Nimble
import Succinct

final class UIViewController_UISliderSpec: QuickSpec {
    override func spec() {
        describe("finding a slider with a specific value") {
            it("returns 0 when there are no sliders") {
                let viewController = UIViewControllerBuilder().build()


                let hasSlider = viewController.hasSlider(withValue: 1.0)


                expect(hasSlider).to(beFalse())
            }

            it("can find a slider located in the first subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(UISliderBuilder().withValue(1.0).build())
                    .build()
                
                
                let hasSlider = viewController.hasSlider(withValue: 1.0)
                
                
                expect(hasSlider).to(beTrue())
            }

            it("can find a slider located in the second subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withSubview(UISliderBuilder().withValue(1.0).build())
                            .build()
                    )
                    .build()
                
                
                let hasSlider = viewController.hasSlider(withValue: 1.0)
                
                
                expect(hasSlider).to(beTrue())
            }
            
            it("cannot find a slider that exists in the view with a different value") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UISliderBuilder().withValue(1.0).build()
                    )
                    .build()
                
                
                let hasSlider = viewController.hasSlider(withValue: 0.9)
                
                
                expect(hasSlider).to(beFalse())
            }
        }

        describe("the count of sliders") {
            it("can count sliders found in the first subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(UISliderBuilder().build())
                    .build()
                
                
                let count = viewController.sliderCount()


                expect(count).to(equal(1))
            }

            it("can count sliders found in the second subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withSubview(UISliderBuilder().withValue(1.0).build())
                            .build()
                    )
                    .build()
                
                
                let count = viewController.sliderCount()
                
                
                expect(count).to(equal(1))
            }
        }
    }
}
