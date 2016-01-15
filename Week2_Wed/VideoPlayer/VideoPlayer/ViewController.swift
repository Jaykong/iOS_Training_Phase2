//
//  ViewController.swift
//  VideoPlayer
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa
import AVFoundation
import Quartz
class ViewController: NSViewController {
    var player:AVPlayer?
    @IBOutlet var playerView: NSView!
    
    
    @IBAction func play(sender: AnyObject) {
        player!.play()
    }
    
    @IBAction func playSlowMotion(sender: AnyObject) {
        player!.rate = 0.25
    }
    
    @IBAction func rewind(sender: AnyObject) {
        player!.seekToTime(kCMTimeZero)
    }
    
    func playerWithResource(name:String,extention:String) -> AVPlayer {
        let url = NSBundle.mainBundle().URLForResource("TestVideo", withExtension: "m4v")
        let aPlayer = AVPlayer(URL: url!)
        aPlayer.actionAtItemEnd = AVPlayerActionAtItemEnd.None
        return aPlayer
        
    }
    
    func playerLayer(player:AVPlayer) -> AVPlayerLayer{
        let layer = AVPlayerLayer(player: player)
        layer.frame = self.playerView.bounds
        layer.autoresizingMask =
            [CAAutoresizingMask.LayerWidthSizable, CAAutoresizingMask.LayerHeightSizable]
        print(self.playerView.bounds)
        print(layer.frame)
        return layer
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
   self.player = self.playerWithResource("TestVideo", extention: "m4v")
   let avLayer = self.playerLayer(self.player!)
   self.playerView.layer?.addSublayer(avLayer)
    
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

