//
//  YSCards+NSAttributedString.swift
//  YSCards
//
//  Created by Cem Olcay on 30/10/15.
//  Copyright © 2015 prototapp. All rights reserved.
//

import UIKit

func += <KeyType, ValueType> (inout left: Dictionary<KeyType, ValueType>,
    right: Dictionary<KeyType, ValueType>) {
        for (k, v) in right {
            left.updateValue(v, forKey: k)
        }
}

enum NSAttributedStringStyle {
    case plain
    case underline (NSUnderlineStyle, UIColor)
    case strike (UIColor, CGFloat)

    func attribute () -> [String: NSObject] {
        switch self {
        case .plain:
            return [:]
        case .underline(let styleName, let color):
            return [NSUnderlineStyleAttributeName: styleName.rawValue, NSUnderlineColorAttributeName: color]
        case .strike(let color, let width):
            return [NSStrikethroughColorAttributeName: color, NSStrikethroughStyleAttributeName: width]
        }
    }
}

extension NSAttributedString {

    // MARK: Init

    convenience init (
        text: String,
        color: UIColor,
        font: UIFont,
        style: NSAttributedStringStyle = .plain) {
            var atts = [NSFontAttributeName: font, NSForegroundColorAttributeName: color]
            atts += style.attribute()
            self.init (string: text, attributes: atts)
    }

    convenience init (image: UIImage) {
        let att = NSTextAttachment ()
        att.image = image
        self.init (attachment: att)
    }

    convenience init? (string: String, html: String) {
        try? self.init(
            data: (html + string).dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)!,
            options: [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding],
            documentAttributes: nil)
    }

    convenience init (attributedStrings: NSAttributedString...) {
        let mutableAtt = NSMutableAttributedString()
        for att in attributedStrings {
            mutableAtt.appendAttributedString (att)
        }
        self.init(attributedString: mutableAtt.mutableCopy() as! NSAttributedString)
    }

    // MARK: Size

    func getSize (width: CGFloat = .max, height: CGFloat = .max) -> CGSize {
        return boundingRectWithSize(
            CGSize(width: width, height: height),
            options: .UsesLineFragmentOrigin,
            context: nil).size
    }
}
