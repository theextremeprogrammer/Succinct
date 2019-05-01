import Quick
import Nimble
@testable import Succinct

final class UIViewController_UISwitchSpec: QuickSpec {
    private var switch_wasTapped: Bool = false
    private func unitTestSwitchWasTapped(_ sender: Any) {
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
                    var viewController: UIViewController!
                    
                    beforeEach {
                        let targetAction = TargetAction(self.unitTestSwitchWasTapped)
                        
                        let uiSwitch = UISwitchBuilder()
                            .withIsOn(false)
                            .withTargetAction(targetAction)
                            .build()
                        
                        viewController = UIViewControllerBuilder()
                            .withSubview(
                                CustomViewBuilder<SomeUniqueUIView>()
                                    .withSubview(uiSwitch)
                                    .build()
                            )
                            .build()
                        viewController.loadViewControllerForUnitTest()
                        
                        
                        viewController.tapSwitch(containedInView: SomeUniqueUIView.self)
                    }
                    
                    it("can tap a switch") {
                        expect(self.switch_wasTapped).to(beTrue())
                    }
                    
                    it("updates the isOn property of the switch because Apple won't do this " +
                        "for us from a unit test even though they do it as a part of UIKit") {
                        let currentSwitch = viewController.findSwitch(containedInView: UIView.self)
                        expect(currentSwitch?.isOn).to(beTrue())
                    }
                }
            }
            
            describe("when the switch is in the second layer of the view hierarchy") {
                context("when the contained in view does NOT exist in the view hierarchy") {
                    it("cannot tap a switch") {
                        let targetAction = TargetAction(self.unitTestSwitchWasTapped)
                        
                        let uiSwitch = UISwitchBuilder()
                            .withTargetAction(targetAction)
                            .build()
                        
                        let viewController = UIViewControllerBuilder()
                            .withSubview(
                                CustomViewBuilder<UIView>()
                                    .withSubview(uiSwitch)
                                    .build()
                            )
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
                                CustomViewBuilder<UIView>()
                                    .withSubview(
                                        CustomViewBuilder<SomeUniqueUIView>()
                                            .withSubview(uiSwitch)
                                            .build()
                                    )
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

        describe("tapping switches based on the label text they are co-located with") {
            beforeEach {
                self.switch_wasTapped = false
            }

            describe("when the switch and label are in view hierarchy") {
                it("taps the switch") {
                    let targetAction = TargetAction(self.unitTestSwitchWasTapped)

                    let uiSwitch = UISwitchBuilder()
                        .withTargetAction(targetAction)
                        .build()

                    let viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UILabelBuilder().withTitleText("Option").build(),
                            uiSwitch
                        )
                        .build()
                    viewController.loadViewControllerForUnitTest()


                    viewController.tapSwitch(
                        colocatedWithUILabelWithExactText: "Option"
                    )


                    expect(self.switch_wasTapped).to(beTrue())
                }
            }
        }
    }
}
