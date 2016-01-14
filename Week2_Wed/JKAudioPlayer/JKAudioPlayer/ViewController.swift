//
//  ViewController.swift
//  JKAudioPlayer
//
//  Created by trainer on 1/9/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    var audioPlayer:AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       let audioUrl = NSBundle.mainBundle().URLForResource("TestSound", withExtension: "wav")
        
        
        do {
            audioPlayer = try AVAudioPlayer( contentsOfURL: audioUrl!)
        } catch {
            print(error)
        }
        
        
       
       
        audioPlayer.numberOfLoops = -1
        audioPlayer.volume = 1
        audioPlayer.currentTime = 0
        audioPlayer.play()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

