//: Playground - noun: a place where people can play

import UIKit

class View: UIView {
    override func drawRect(rect: CGRect) {
        let pathRect = CGRectInset(self.bounds, 8, 8)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 20)
        path.lineWidth = 4
        
        UIColor.greenColor().setFill()
        UIColor.redColor().setStroke()
        path.fill()
        path.stroke()
    }
}


let view = View(frame: CGRectMake(0, 0, 200, 200))