import Quick
import Nimble
@testable import Succinct

class DebugLogging_UIViewSpec: QuickSpec {
    override func spec() {
        describe("finding objects within subviews") {
            describe("debug logging the view hierarchy") {
                var spyOutputMethod: SpyOutputMethod!
                
                beforeEach {
                    spyOutputMethod = SpyOutputMethod()
                    
                    Succinct.config.enableDebugLog()
                    Succinct.log.useOutputMethod(spyOutputMethod)
                }
                
                afterEach {
                    Succinct.config.disableDebugLog()
                    Succinct.log.useDefaultOutputMethod()
                }

                context("when there are no subviews") {
                    beforeEach {
                        let view = UIViewBuilder().build()
                        
                        
                        _ = view.findInSubviews(satisfyingCondition: { _ in return false})
                    }
                    
                    it("outputs the open tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("    <UIView"))
                    }

                    it("outputs the close tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.second).to(equal("    </UIView>"))
                    }
                }
                
                context("when there is a single subview") {
                    beforeEach {
                        let view = UIViewBuilder()
                            .withSubview(UIViewBuilder().build())
                            .build()
                        
                        
                        _ = view.findInSubviews(satisfyingCondition: { _ in return false})
                    }
                    
                    it("outputs the open tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("    <UIView"))
                    }
                    
                    it("outputs the open tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.second).to(contain("        <UIView"))
                    }
                    
                    it("outputs the close tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.third).to(equal("        </UIView>"))
                    }
                    
                    it("outputs the close tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.fourth).to(equal("    </UIView>"))
                    }
                }

                context("when there are date pickers") {
                    beforeEach {
                        let view = UIViewBuilder()
                            .withSubview(UIDatePicker())
                            .build()

                        _ = view.findInSubviews(satisfyingCondition: { _ in return false})
                    }

                    it("outputs the open tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("    <UIView"))
                    }

                    it("outputs the open tag of the inside DatePicker view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.second).to(contain("        <UIDatePicker"))
                    }

                    it("outputs the close tag of the inside DatePicker view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.third).to(equal("        </UIDatePicker>"))
                    }

                    it("outputs the close tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.fourth).to(equal("    </UIView>"))
                    }
                }

                context("when there are two levels of subviews") {
                    beforeEach {
                        let view = UIViewBuilder()
                            .withSubview(
                                UIViewBuilder()
                                    .withSubview(UIViewBuilder().build())
                                    .build()
                            )
                            .build()
                        
                        
                        _ = view.findInSubviews(satisfyingCondition: { _ in return false})
                    }
                    
                    it("outputs the open tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("    <UIView"))
                    }
                    
                    it("outputs the open tag of the middle view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.second).to(contain("        <UIView"))
                    }

                    it("outputs the open tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.third).to(contain("            <UIView"))
                    }
                    
                    it("outputs the close tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.fourth).to(equal("            </UIView>"))
                    }

                    it("outputs the close tag of the middle view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.fifth).to(equal("        </UIView>"))
                    }
                    
                    it("outputs the close tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.sixth).to(equal("    </UIView>"))
                    }
                }
                
                context("when custom subviews are used") {
                    final class SomeUniqueUIView: UIView {}
                    final class AnotherUniqueUIView: UIView {}

                    beforeEach {
                        let view = CustomUIViewBuilder<SomeUniqueUIView>()
                            .withSubview(CustomUIViewBuilder<AnotherUniqueUIView>().build())
                            .build()
                        
                        
                        _ = view.findInSubviews(satisfyingCondition: { _ in return false})
                    }
                    
                    it("outputs the open tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("    <SomeUniqueUIView"))
                    }
                    
                    it("outputs the open tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.second).to(contain("        <AnotherUniqueUIView"))
                    }
                    
                    it("outputs the close tag of the inside view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.third).to(equal("        </AnotherUniqueUIView>"))
                    }
                    
                    it("outputs the close tag of the containing view") {
                        expect(spyOutputMethod.standardPrint_argument_messages.fourth).to(equal("    </SomeUniqueUIView>"))
                    }
                }
            }
        }
    }
}
