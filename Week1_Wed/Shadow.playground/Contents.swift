//: Playground - noun: a place where people can play

import UIKit

class View:UIView {
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
       let rect = CGRectInset(rect, rect.size.width * 0.3,  rect.size.height * 0.3)
        let rectRight = CGRectMake(700, 150, 100, 100)
        
        let cornerRadius :CGFloat = 20
        let rectPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        CGContextSaveGState(context)
        let shadow = UIColor.whiteColor().CGColor
        let shadowOffset = CGSize(width: 5, height: 5)
        let shadwoBlurRadius: CGFloat = 5.0
        
        CGContextSetShadowWithColor(context, shadowOffset, shadwoBlurRadius, shadow)
        UIColor.redColor().setFill()
        rectPath.fill()
        
    CGContextRestoreGState(context)
        let rectRightPath = UIBezierPath(ovalInRect: rectRight)
        UIColor.greenColor().setFill()
        rectRightPath.fill()

        
    }
    
}


let view = View(frame: CGRectMake(0, 0, 1000, 500))

