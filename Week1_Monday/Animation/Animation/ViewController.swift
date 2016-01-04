//
//  ViewController.swift
//  Animation
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var colorView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
UIView.animateKeyframesWithDuration(2, delay: 0, options: UIViewKeyframeAnimationOptions.LayoutSubviews, animations: { () -> Void in
UIView.addKeyframeWithRelativeStartTime(0, relativeDuration: 1, animations: { () -> Void in
    self.colorView.center = self.view.center
    })
UIView.addKeyframeWithRelativeStartTime(1, relativeDuration: 1, animations: { () -> Void in
    self.colorView.backgroundColor = UIColor.greenColor()
})
UIView.addKeyframeWithRelativeStartTime(2, relativeDuration: 1, animations: { () -> Void in
    let rotation = CGFloat(M_PI * 45.0/180.0)
    let rotationTrans  = CGAffineTransformMakeRotation(rotation)
    self.colorView.transform = rotationTrans
})
            
}){ (complete:Bool) -> Void in
    print("completed")
  }
}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

