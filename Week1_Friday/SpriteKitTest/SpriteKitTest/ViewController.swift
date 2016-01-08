//
//  ViewController.swift
//  SpriteKitTest
//
//  Created by trainer on 1/7/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import SpriteKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MenuScene(size: self.view.bounds.size)
        scene.backgroundColor = UIColor.blackColor()
        let skView = self.view as! SKView
        let transition = SKTransition.moveInWithDirection(.Down, duration: 3)
        skView.presentScene(scene,transition: transition)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

