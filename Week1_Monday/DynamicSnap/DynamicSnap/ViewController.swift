//
//  ViewController.swift
//  DynamicSnap
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var snap:UISnapBehavior?
    @IBAction func tapped(sender: AnyObject) {
        
        let tap  = sender as! UITapGestureRecognizer
        let point = tap.locationInView(view)
        if snap != nil {
        self.dynamicAnimator?.removeBehavior(snap!)
        }
        snap = UISnapBehavior(item: imageView, snapToPoint: point)
        dynamicAnimator?.addBehavior(snap!)
    }
    @IBOutlet weak var imageView: UIImageView!
    var dynamicAnimator:UIDynamicAnimator?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        dynamicAnimator = UIDynamicAnimator(referenceView: view)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

