//: Playground - noun: a place where people can play

import UIKit

class View: UIView {
    
 override func drawRect(rect: CGRect) {
    let bezierPath = UIBezierPath()
    let squareRect = CGRectInset(rect, rect.size.width * 0.45, rect.size.height * 0.05)
    let circleRect = CGRectInset(rect, rect.size.width * 0.3, rect.size.height * 0.3)
    let cornerRadius:CGFloat = 20
    let circlePath = UIBezierPath(ovalInRect: circleRect)
    let squarePath = UIBezierPath(roundedRect: squareRect, cornerRadius: cornerRadius)
    
    bezierPath.appendPath(circlePath)
    bezierPath.appendPath(squarePath)
    
    UIColor.redColor().setFill()
    bezierPath.fill()

    }
    
}


let view = View(frame: CGRectMake(0, 0, 300, 300))
