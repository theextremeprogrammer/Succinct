import UIKit

import Quick
import Nimble
@testable import Succinct

final class UIViewController_UISwitchSpec: QuickSpec {
    private var switch_wasTapped: Bool = false
    private func unitTestSwitchWasTapped() {
        switch_wasTapped = true
    }
    
    final class SomeUniqueUIView: UIView {}
    
    override func spec() {
        describe("tapping switches based on the view that they are inside") {
            beforeEach {
                self.switch_wasTapped = false
            }
            
            describe("when the switch is in the first layer of the view hierarchy") {
                context("when the contained in view does NOT exist in the view hierarchy") {
                    it("cannot tap a switch") {
                        let targetAction = TargetAction(self.unitTestSwitchWasTapped)
                        
                        let uiSwitch = UISwitchBuilder()
                            .withTargetAction(targetAction)
                            .build()
                        
                        let viewController = UIViewControllerBuilder()
                            .withSubview(uiSwitch)
                            .build()
                        viewController.loadViewControllerForUnitTest()
                        
                        
                        viewController.tapSwitch(containedInView: SomeUniqueUIView.self)
                        
                        
                        expect(self.switch_wasTapped).to(beFalse())
                    }
                }
                
                context("when the contained in view DOES exist in the view hierarchy") {
                    it("can tap a switch") {
                        let targetAction = TargetAction(self.unitTestSwitchWasTapped)
                        
                        let uiSwitch = UISwitchBuilder()
                            .withTargetAction(targetAction)
                            .build()
                        
                        let viewController = UIViewControllerBuilder()
                            .withSubview(
                                ViewBuilder<SomeUniqueUIView>()
                                    .withSubview(uiSwitch)
                                    .build()
                            )
                            .build()
                        viewController.loadViewControllerForUnitTest()
                        
                        
                        viewController.tapSwitch(containedInView: SomeUniqueUIView.self)
                        
                        
                        expect(self.switch_wasTapped).to(beTrue())
                    }
                }
            }
        }
    }
}
