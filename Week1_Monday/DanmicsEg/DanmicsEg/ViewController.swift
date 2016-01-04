//
//  ViewController.swift
//  DanmicsEg
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var danamicAnimator = UIDynamicAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        danamicAnimator = UIDynamicAnimator(referenceView: view)
        let gravityBehavior = UIGravityBehavior(items: [imageView])
        danamicAnimator.addBehavior(gravityBehavior)
        
        let collisionBeha = UICollisionBehavior(items: [imageView])
        collisionBeha.translatesReferenceBoundsIntoBoundary = true
        danamicAnimator.addBehavior(collisionBeha)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

