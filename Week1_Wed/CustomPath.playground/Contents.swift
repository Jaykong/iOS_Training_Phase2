//: Playground - noun: a place where people can play

import UIKit

class View: UIView {
    override func drawRect(rect: CGRect) {
        let bezierPath = UIBezierPath()
        let rect = CGRectInset(self.bounds, self.bounds.size.width * 0.05, self.bounds.size.height * 0.05)
        
        let topLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMinY(rect))
        let topRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMinY(rect))
        
        
        let bottomRight = CGPointMake(CGRectGetMaxX(rect), CGRectGetMaxY(rect))
        let bottomLeft = CGPointMake(CGRectGetMinX(rect), CGRectGetMaxY(rect))
        
        let center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
        
        bezierPath.moveToPoint(topLeft)
        bezierPath.addLineToPoint(topRight)
        bezierPath.addLineToPoint(bottomLeft)
        bezierPath.addCurveToPoint(bottomRight, controlPoint1: center, controlPoint2: center)
        bezierPath.closePath()
        
        UIColor.redColor().setFill()
        UIColor.redColor().setStroke()
        bezierPath.fill()
        bezierPath.stroke()
       
    }
}

let view = View(frame: CGRectMake(0, 0, 300, 300))

