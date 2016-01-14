//
//  ViewController.swift
//  JKAVKit-iOS
//
//  Created by trainer on 1/9/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       //self.view.removeConstraints(self.view.constraints)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "videoSegue" {
     let controller = segue.destinationViewController as! AVPlayerViewController
     let url = NSBundle.mainBundle().URLForResource("mySQL", withExtension: "mp4")
    let player = AVPlayer(URL: url!)
    controller.player = player
    }
  }

}

