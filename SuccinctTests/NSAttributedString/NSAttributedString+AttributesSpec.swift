import Quick
import Nimble
import Succinct

final class NSAttributedString_AttributeSpec: QuickSpec {
    override func spec() {
        describe("finding attributes for an exact substring") {
            context("when there is a single attribute") {
                it("can find text with a foregroundColor") {
                    let redForegroundColor = [NSAttributedString.Key.foregroundColor : UIColor.red]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redForegroundColor, forString: "Foreground")
                        .build()


                    expect(attributedString.containsExactString("Foreground", withAttributes: redForegroundColor)).to(beTrue())
                }

                it("can find text with a backgroundColor") {
                    let redBackgroundColor = [NSAttributedString.Key.backgroundColor : UIColor.red]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redBackgroundColor, forString: "Background")
                        .build()


                    expect(attributedString.containsExactString("Background", withAttributes: redBackgroundColor)).to(beTrue())
                }

                it("can find text with a specific font") {
                    let smallFont = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Small and Large")
                        .withAttributes(smallFont, forString: "Small")
                        .build()


                    expect(attributedString.containsExactString("Small", withAttributes: smallFont)).to(beTrue())
                }

                it("can find text that is underlined") {
                    let smallFontAndRedBackground = [
                        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.patternDash,
                        NSAttributedString.Key.underlineColor : UIColor.red
                        ] as [NSAttributedString.Key : Any]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(smallFontAndRedBackground, forString: "Underlined")
                        .build()


                    expect(attributedString.containsExactString("Underlined", withAttributes: smallFontAndRedBackground)).to(beTrue())
                }

                it("can find text that is underlined with a custom underline") {
                    let CustomUnderlineStyle = 0x11
                    let smallFontAndRedBackground = [
                        NSAttributedString.Key.underlineStyle : CustomUnderlineStyle,
                        NSAttributedString.Key.underlineColor : UIColor.red
                        ] as [NSAttributedString.Key : Any]

                    let attributedString = NSMutableAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(smallFontAndRedBackground, forString: "Underlined")
                        .build()


                    expect(attributedString.containsExactString("Underlined", withAttributes: smallFontAndRedBackground)).to(beTrue())
                }

                it("can find text that is is a link") {
                    let linkAttributes = [
                        NSAttributedString.Key.link : "url"
                        ] as [NSAttributedString.Key : Any]

                    let attributedString = NSMutableAttributedStringBuilder(withText: "Link Text")
                        .withAttributes(linkAttributes, forString: "Link")
                        .build()


                    expect(attributedString.containsExactString("Link", withAttributes: linkAttributes)).to(beTrue())
                }
            }

            context("when there are multiple attributes") {
                it("can find both attributes") {
                    let tappableText = [
                        NSAttributedString.Key.foregroundColor: UIColor.lightGray,
                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
                        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDash,
                        NSAttributedString.Key.underlineColor: UIColor.lightGray
                    ] as [NSAttributedString.Key : Any]

                    let attributedString = NSMutableAttributedStringBuilder(withText: "Tappable Text")
                        .withAttributes(tappableText, forString: "Tappable")
                        .build()


                    expect(attributedString.containsExactString("Tappable", withAttributes: tappableText)).to(beTrue())
                }
            }

            context("when there are no attributes") {
                it("finds nothing") {
                    let redBackgroundColor = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Nothing")
                        .build()


                    expect(attributedString.containsExactString("Nothing", withAttributes: redBackgroundColor)).to(beFalse())
                }
            }

            context("when there are multiple instances of the search string") {
                it("finds only the first instance") {
                    let redForegroundColor = [
                        NSAttributedString.Key.foregroundColor: UIColor.red,
                        ] as [NSAttributedString.Key : Any]

                    let greenForegroundColor = [
                        NSAttributedString.Key.foregroundColor: UIColor.green,
                        ] as [NSAttributedString.Key : Any]

                    let firstSentanceRange = NSRange(location: 1, length: 9)
                    let secondSentanceRange = NSRange(location: 24, length: 9)

                    let attributedString = NSMutableAttributedStringBuilder(withText: "A sentance with the word sentance twice")
                        .withAttributes(
                            redForegroundColor,
                            range: firstSentanceRange
                        )
                        .withAttributes(
                            greenForegroundColor,
                            range: secondSentanceRange
                        )
                        .build()


                    expect(attributedString.containsExactString("sentance", withAttributes: redForegroundColor)).to(beTrue())
                    expect(attributedString.containsExactString("sentance", withAttributes: greenForegroundColor)).to(beFalse())
                }
            }

            context("when the search string does not exist in the attributed string") {
                it("cannot find the string") {
                    let redForegroundColor = [NSAttributedString.Key.foregroundColor : UIColor.red]
                    let attributedString = NSMutableAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redForegroundColor, forString: "Foreground")
                        .build()


                    expect(attributedString.containsExactString("Invalid", withAttributes: redForegroundColor)).to(beFalse())
                }
            }
        }
    }
}
