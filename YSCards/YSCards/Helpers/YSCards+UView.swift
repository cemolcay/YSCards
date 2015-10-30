//
//  YSCards+UView.swift
//  YSCards
//
//  Created by Cem Olcay on 30/10/15.
//  Copyright © 2015 prototapp. All rights reserved.
//

import UIKit

// MARK: - Frame Extensions

extension UIView {

    var x: CGFloat {
        get {
            return self.frame.origin.x
        } set {
            self.frame = CGRect (x: newValue, y: self.y, width: self.w, height: self.h)
        }
    }

    var y: CGFloat {
        get {
            return self.frame.origin.y
        } set {
            self.frame = CGRect (x: self.x, y: newValue, width: self.w, height: self.h)
        }
    }

    var w: CGFloat {
        get {
            return self.frame.size.width
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: newValue, height: self.h)
        }
    }

    var h: CGFloat {
        get {
            return self.frame.size.height
        } set {
            self.frame = CGRect (x: self.x, y: self.y, width: self.w, height: newValue)
        }
    }


    var left: CGFloat {
        get {
            return self.x
        } set {
            self.x = newValue
        }
    }

    var right: CGFloat {
        get {
            return self.x + self.w
        } set {
            self.x = newValue - self.w
        }
    }

    var top: CGFloat {
        get {
            return self.y
        } set {
            self.y = newValue
        }
    }

    var bottom: CGFloat {
        get {
            return self.y + self.h
        } set {
            self.y = newValue - self.h
        }
    }


    var position: CGPoint {
        get {
            return self.frame.origin
        } set {
            self.frame = CGRect (origin: newValue, size: self.frame.size)
        }
    }

    var size: CGSize {
        get {
            return self.frame.size
        } set {
            self.frame = CGRect (origin: self.frame.origin, size: newValue)
        }
    }

    var selfCenter: CGPoint {
        return CGPoint(x: w/2, y: h/2)
    }

    func leftWithOffset (offset: CGFloat) -> CGFloat {
        return self.left - offset
    }

    func rightWithOffset (offset: CGFloat) -> CGFloat {
        return self.right + offset
    }

    func topWithOffset (offset: CGFloat) -> CGFloat {
        return self.top - offset
    }

    func bottomWithOffset (offset: CGFloat) -> CGFloat {
        return self.bottom + offset
    }


    func leftWithInset (inset: CGFloat) -> CGFloat {
        return self.left + inset
    }

    func rightWithInset (inset: CGFloat) -> CGFloat {
        return self.right - inset
    }

    func topWithInset (inset: CGFloat) -> CGFloat {
        return self.top - inset
    }

    func bottomWithInset (inset: CGFloat) -> CGFloat {
        return self.bottom - inset
    }

}


// MARK: - Border Extensions

extension UIView {

    func addBorder (
        width: CGFloat,
        color: UIColor) {
            self.layer.borderWidth = width
            self.layer.borderColor = color.CGColor
            self.layer.masksToBounds = true
    }

    func addTopBorder (
        inset: UIEdgeInsets = UIEdgeInsetsZero,
        lineWidth: CGFloat,
        color: UIColor) {
        let border = CALayer(
            x: inset.left,
            y: inset.top,
            w: w - inset.left - inset.right,
            h: lineWidth)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }

    func addBottomBorder (
        inset: UIEdgeInsets = UIEdgeInsetsZero,
        lineWidth: CGFloat,
        color: UIColor) {
        let border = CALayer(
            x: inset.left, y:
            h - inset.bottom,
            w: w - inset.left - inset.right,
            h: lineWidth)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }

    func addLeftBorder (
        inset: UIEdgeInsets = UIEdgeInsetsZero,
        lineWidth: CGFloat,
        color: UIColor) {
        let border = CALayer(
            x: inset.left,
            y: inset.top,
            w: lineWidth,
            h: h - inset.top - inset.bottom)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }

    func addRightBorder (
        inset: UIEdgeInsets = UIEdgeInsetsZero,
        lineWidth: CGFloat,
        color: UIColor) {
        let border = CALayer(
            x: inset.left,
            y: inset.top,
            w: lineWidth,
            h: h - inset.top - inset.bottom)
        border.backgroundColor = color.CGColor
        layer.addSublayer(border)
    }
}

// MARK: - Shadow Extensions

extension UIView {

    func addShadow (
        offset: CGSize,
        radius: CGFloat,
        color: UIColor,
        opacity: Float,
        cornerRadius: CGFloat? = nil) {
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radius
        self.layer.shadowOpacity = opacity
        self.layer.shadowColor = color.CGColor
        if let r = cornerRadius {
            self.layer.shadowPath = UIBezierPath(
                roundedRect: bounds,
                cornerRadius: r).CGPath
        }
    }
}
