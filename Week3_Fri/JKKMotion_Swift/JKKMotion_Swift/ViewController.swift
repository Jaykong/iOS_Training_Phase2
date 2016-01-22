//
//  ViewController.swift
//  JKKMotion_Swift
//
//  Created by trainer on 1/22/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    @IBOutlet weak var x: UILabel!
    
    @IBOutlet weak var y: UILabel!
    
    @IBOutlet weak var z: UILabel!
    
    @IBOutlet weak var pitch: UILabel!
    
    @IBOutlet weak var roll: UILabel!
    
    
    @IBOutlet weak var yaw: UILabel!
    
    let motionManger = CMMotionManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        if CMPedometer.isStepCountingAvailable() {
            print("available")
        } else {
            print("not available")
        }
        if CMAltimeter.isRelativeAltitudeAvailable() {
            print("available")
        } else {
            print("not available")
        }
        
        motionManger.startDeviceMotionUpdatesToQueue(NSOperationQueue.mainQueue()) { (motion, error) -> Void in
            
            let xStr = String(format: "%.2f", (motion?.userAcceleration.x)!)
            self.x.text = xStr
            
            let yStr = String(format: "%.2f", (motion?.userAcceleration.y)!)
            self.y.text = yStr
            
            let zStr = String(format: "%.2f", (motion?.userAcceleration.z)!)
            self.z.text = zStr
            
            
            if let pValue = motion?.attitude.pitch {
             let pStr = String(format: "%.2f", pValue * 180 / M_PI)
            self.pitch.text = pStr
            }
            
            
            if let pValue = motion?.attitude.roll {
                let pStr = String(format: "%.2f", pValue * 180 / M_PI)
                self.roll.text = pStr
            }
            
            
            if let pValue = motion?.attitude.yaw {
                let pStr = String(format: "%.2f", pValue * 180 / M_PI)
                self.yaw.text = pStr
            }
//            
//            let pitch = NSString(format: "%.2f",(motion?.attitude.pitch)! * 180 / M_PI)
//            self.pitch.text = pitch as String
//            
//            let roll = NSString(format: "%.2f",(motion?.attitude.roll)!)
//            self.roll.text = roll as String
//            
//            let yaw = NSString(format: "%.2f",(motion?.attitude.yaw)!)
//            self.yaw.text = yaw as String
            
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

