//
//  ViewController.swift
//  JKAVSpeech
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,UITextViewDelegate {

    @IBOutlet weak var textView: UITextView!
    var synthesizer:AVSpeechSynthesizer!
    
    @IBAction func pauseWord(sender: AnyObject) {
        synthesizer.pauseSpeakingAtBoundary(.Word)
    }
    @IBAction func pause(sender: AnyObject) {
        synthesizer.pauseSpeakingAtBoundary(AVSpeechBoundary.Immediate)
    }
    @IBAction func contine(sender: AnyObject) {
        synthesizer.continueSpeaking()
    }
    
@IBAction func play(sender: AnyObject) {
   
   let utteranceString = textView.text
   let utterance = AVSpeechUtterance(string: utteranceString)
       utterance.rate = 0.5
   let hans = AVSpeechSynthesisVoice(language: "zh-CN")
   utterance.voice = hans
   synthesizer = AVSpeechSynthesizer()
   synthesizer.speakUtterance(utterance)
 }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func stop(sender: AnyObject) {
      synthesizer.stopSpeakingAtBoundary(AVSpeechBoundary(rawValue: 5)!)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
           
        }
        return true
    }
    
}

