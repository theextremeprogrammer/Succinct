import UIKit

extension UIImage {
    private final class SomeClassDefinedWithinTheUnitTestingBundle {}

    enum AssetIdentifier: String {
        case obligatoryCatImage
    }

    convenience init!(assetIdentifier: AssetIdentifier) {
        let testBundle = Bundle.init(for: SomeClassDefinedWithinTheUnitTestingBundle.self)

        self.init(
            named: assetIdentifier.rawValue,
            in: testBundle,
            compatibleWith: nil
        )
    }
}
