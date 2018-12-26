import Quick
import Nimble
import Succinct

final class NSAttributedString_attributeSpec: QuickSpec {
    override func spec() {
        describe("finding attributes for an exact substring") {

            context("when there is a single attribute") {
                it("can find foregroundColor") {
                    let redForegroundColor = [NSAttributedString.Key.foregroundColor : UIColor.red]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(
                            redForegroundColor,
                            range: NSRange(location: 0, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redForegroundColor, atSubString: "Foreground")).to(beTrue())
                }

                it("can find backgroundColor") {
                    let redBackgroundColor = [NSAttributedString.Key.backgroundColor : UIColor.red]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(
                            redBackgroundColor,
                            range: NSRange(location: 15, length: 10)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redBackgroundColor, atSubString: "Background")).to(beTrue())
                }

                it("can find font") {
                    let smallFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Small and Large")
                        .withAttributes(
                            smallFont,
                            range: NSRange(location: 0, length: 5)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(smallFont, atSubString: "Small")).to(beTrue())
                }
            }

            context("when there are multiple attributes") {
                it("can find both attributes") {
                    let smallFontAndRedBackground = [
                        NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10),
                        NSAttributedString.Key.foregroundColor : UIColor.red
                    ]

                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Small and Red")
                        .withAttributes(
                            smallFontAndRedBackground,
                            range: NSRange(location: 0, length: 13)
                        )
                        .build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(smallFontAndRedBackground, atSubString: "Small and Red")).to(beTrue())
                }
            }

            context("when there are no attributes") {
                it("finds nothing") {
                    let redBackgroundColor = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let mutableAttributedString = NSMutableAttributedStringBuilder(withText: "Nothing").build()


                    let attributedString = mutableAttributedString.copy() as! NSAttributedString
                    expect(attributedString.hasAttributes(redBackgroundColor, atSubString: "Nothing")).to(beFalse())
                }
            }
        }
    }
}
