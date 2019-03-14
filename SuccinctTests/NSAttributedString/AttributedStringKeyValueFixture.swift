import UIKit

struct AttributedStringKeyValueFixture {
    static let CustomUnderlineStyle = 0x11

    static let linkAttributes = [NSAttributedString.Key.link : "url"]

    static let redForegroundColorAttributes = [NSAttributedString.Key.foregroundColor : UIColor.red]

    static let greenForegroundColorAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]

    static let redBackgroundColorAttributes = [NSAttributedString.Key.backgroundColor : UIColor.red]

    static let smallFontAttributes = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10)]

    static let smallFontAndRedBackground = [
        NSAttributedString.Key.underlineStyle : NSUnderlineStyle.patternDash,
        NSAttributedString.Key.underlineColor : UIColor.red] as [NSAttributedString.Key : Any]

    static let smallFontAndCustomUnderline = [
        NSAttributedString.Key.underlineStyle : CustomUnderlineStyle,
        NSAttributedString.Key.underlineColor : UIColor.red] as [NSAttributedString.Key : Any]

    static let tappableTextAttributes = [
        NSAttributedString.Key.foregroundColor: UIColor.lightGray,
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold),
        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDash,
        NSAttributedString.Key.underlineColor: UIColor.lightGray] as [NSAttributedString.Key : Any]

    static let tappableJapaneseText = [
        NSAttributedString.Key.link: "url",
        NSAttributedString.Key.foregroundColor: UIColor.lightGray,
        NSAttributedString.Key.font: UIFont(name: "HiraginoSans-W6", size: 16)!,
        NSAttributedString.Key.underlineStyle: NSUnderlineStyle.patternDash,
        NSAttributedString.Key.underlineColor: UIColor.lightGray
        ] as [NSAttributedString.Key : Any]
}
