//: Playground - noun: a place where people can play

import UIKit

class View:UIView {
    override func drawRect(rect: CGRect) {
        let pathRect = CGRectInset(self.bounds, self.bounds.size.width * 0.01, self.bounds.size.height * 0.01)
        let rotationTransform = CGAffineTransformMakeRotation(CGFloat(M_PI)/6.0)
        let rectPath = UIBezierPath(roundedRect: pathRect, cornerRadius: 20.0)
        let context = UIGraphicsGetCurrentContext()
        CGContextSaveGState(context)
        CGContextConcatCTM(context, rotationTransform)
        UIColor.redColor().setFill()
        rectPath.fill()
        CGContextRestoreGState(context)
    }
}

let view = View(frame: CGRectMake(0, 0,200,200))

