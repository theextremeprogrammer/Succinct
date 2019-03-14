import Quick
import Nimble
import Succinct

final class NSAttributedString_AttributeSpec: QuickSpec {
    override func spec() {
        describe("finding attributes for an exact substring") {
            context("when there is a single attribute") {
                it("can find text with a foregroundColor") {
                    let redForegroundColor = AttributedStringKeyValueFixture.redForegroundColorAttributes
                    let attributedString = NSAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redForegroundColor, forString: "Foreground")
                        .build()


                    expect(attributedString.containsExactString("Foreground", withAttributes: redForegroundColor)).to(beTrue())
                }

                it("can find text with a backgroundColor") {
                    let redBackgroundColor = AttributedStringKeyValueFixture.redBackgroundColorAttributes
                    let attributedString = NSAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redBackgroundColor, forString: "Background")
                        .build()


                    expect(attributedString.containsExactString("Background", withAttributes: redBackgroundColor)).to(beTrue())
                }

                it("can find text with a specific font") {
                    let smallFont = AttributedStringKeyValueFixture.smallFontAttributes
                    let attributedString = NSAttributedStringBuilder(withText: "Small and Large")
                        .withAttributes(smallFont, forString: "Small")
                        .build()


                    expect(attributedString.containsExactString("Small", withAttributes: smallFont)).to(beTrue())
                }

                it("can find text that is underlined") {
                    let smallFontAndRedBackground = AttributedStringKeyValueFixture.smallFontAndRedBackground
                    let attributedString = NSAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(smallFontAndRedBackground, forString: "Underlined")
                        .build()


                    expect(attributedString.containsExactString("Underlined", withAttributes: smallFontAndRedBackground)).to(beTrue())
                }

                it("can find text that is underlined with a custom underline") {
                    let smallFontAndCustomUnderline = AttributedStringKeyValueFixture.smallFontAndCustomUnderline

                    let attributedString = NSAttributedStringBuilder(withText: "Underlined Text")
                        .withAttributes(smallFontAndCustomUnderline, forString: "Underlined")
                        .build()


                    expect(attributedString.containsExactString("Underlined", withAttributes: smallFontAndCustomUnderline)).to(beTrue())
                }

                it("can find text that is is a link") {
                    let linkAttributes = AttributedStringKeyValueFixture.linkAttributes

                    let attributedString = NSAttributedStringBuilder(withText: "Link Text")
                        .withAttributes(linkAttributes, forString: "Link")
                        .build()


                    expect(attributedString.containsExactString("Link", withAttributes: linkAttributes)).to(beTrue())
                }
            }

            context("when there are multiple attributes") {
                it("can find both attributes") {
                    let tappableText = AttributedStringKeyValueFixture.tappableTextAttributes

                    let attributedString = NSAttributedStringBuilder(withText: "Tappable Text")
                        .withAttributes(tappableText, forString: "Tappable")
                        .build()


                    expect(attributedString.containsExactString("Tappable", withAttributes: tappableText)).to(beTrue())
                }
            }

            context("when there are no attributes") {
                it("finds nothing") {
                    let redBackgroundColor = AttributedStringKeyValueFixture.redBackgroundColorAttributes
                    let attributedString = NSAttributedStringBuilder(withText: "Nothing")
                        .build()


                    expect(attributedString.containsExactString("Nothing", withAttributes: redBackgroundColor)).to(beFalse())
                }
            }

            context("when there are multiple instances of the search string") {
                it("finds only the first instance") {
                    let redForegroundColor = AttributedStringKeyValueFixture.redForegroundColorAttributes
                    let greenForegroundColor = AttributedStringKeyValueFixture.greenForegroundColorAttributes

                    let firstSentanceRange = NSRange(location: 1, length: 9)
                    let secondSentanceRange = NSRange(location: 24, length: 9)

                    let attributedString = NSAttributedStringBuilder(withText: "A sentance with the word sentance twice")
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
                    let redForegroundColor = AttributedStringKeyValueFixture.redForegroundColorAttributes
                    let attributedString = NSAttributedStringBuilder(withText: "Foreground and Background")
                        .withAttributes(redForegroundColor, forString: "Foreground")
                        .build()


                    expect(attributedString.containsExactString("Invalid", withAttributes: redForegroundColor)).to(beFalse())
                }
            }
        }
    }
}
