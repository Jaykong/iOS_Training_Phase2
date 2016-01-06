//: Playground - noun: a place where people can play

import UIKit

class View:UIView {
    override func drawRect(rect: CGRect) {
      // UIColor.greenColor().setFill()
        let path = UIBezierPath(rect: self.bounds)
       // path.fill()
    }
}

let viewRect = CGRectMake(0, 0, 100, 100)
let myView = View(frame: viewRect)

//fill color
//处理路径
