import Quick
import Nimble
import Succinct

final class UIViewController_UISliderSpec: QuickSpec {
    private var sliderValueWasSet = false
    private var newValue: Float = -1.0
    private func unitTestSliderValueChanged(_ sender: Any) {
        sliderValueWasSet = true
        
        let slider = sender as! UISlider
        newValue = slider.value
    }

    override func spec() {
        describe("setting the value of a slider") {
            it("can set the value of a slider in the first subview") {
                let targetAction = TargetAction(self.unitTestSliderValueChanged)
                
                let slider = UISliderBuilder()
                    .withValue(0.1)
                    .withTargetAction(targetAction)
                    .build()
                
                let viewController = UIViewControllerBuilder()
                    .withSubview(slider)
                    .build()
                viewController.loadViewControllerForUnitTest()
                
                
                viewController.setValueOf(sliderWithValue: 0.1, toValue: 0.9)
                
                
                expect(self.sliderValueWasSet).to(beTrue())
                expect(self.newValue).to(equal(0.9))
            }
        }
    }
}
