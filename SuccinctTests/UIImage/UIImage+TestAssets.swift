import UIKit

extension UIImage {
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

class SomeClassDefinedWithinTheUnitTestingBundle {
}
