//
//  ViewController.swift
//  JKAVKit
//
//  Created by trainer on 1/9/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import Cocoa
import AVKit
import AVFoundation
class ViewController: NSViewController {

    @IBOutlet weak var playerView: AVPlayerView!
    override func viewDidLoad() {
        super.viewDidLoad()
      let url = NSBundle.mainBundle().URLForResource("mySQL", withExtension: "mp4")
       let player = AVPlayer(URL: url!)
        playerView.player = player
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

