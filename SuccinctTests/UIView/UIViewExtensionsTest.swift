import XCTest
@testable import Succinct

class UIViewExtensionsTest: XCTestCase {
    func test_findButton_whenButtonExistsAsFirstSubview() {
        let viewController = UIViewControllerBuilder()
            .withSubview(
                UIButtonBuilder().withTitleText("Login").build())
            .build()
        
        
        let result = viewController.view.findButton(withText: "Login")
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.titleLabel?.text, "Login")
    }
    
    func test_findButton_whenButtonExistsAsSecondSubview() {
        let viewController = UIViewControllerBuilder()
            .withSubview(
                UIViewBuilder()
                    .withSubview(
                        UIButtonBuilder().withTitleText("Login").build()
                    )
                    .build()
            )
            .build()
        
        
        let result = viewController.view.findButton(withText: "Login")
        
        
        XCTAssertNotNil(result)
        XCTAssertEqual(result?.titleLabel?.text, "Login")
    }
}
