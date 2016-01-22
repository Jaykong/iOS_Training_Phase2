//
//  ViewController.swift
//  JKKPedometer_Swift
//
//  Created by trainer on 1/22/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    @IBOutlet var stepsLbl: UILabel!
    var pedometer = CMPedometer()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       if CMPedometer.isStepCountingAvailable()
        
       {  let oneDayAgo = NSDate(timeInterval: -24 * 60 * 60, sinceDate: NSDate())
        pedometer.queryPedometerDataFromDate(oneDayAgo, toDate: NSDate()) { (data, error) -> Void in
            self.stepsFromData(data)
        }
       } else {
         self.stepsLbl.text = "not available"
        }
        
        pedometer.startPedometerUpdatesFromDate(NSDate()) { (data, error) -> Void in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.stepsFromData(data)
            })
            
        }
        
    }
    
    
    func stepsFromData(data:CMPedometerData?) {
        
    if let steps = data?.numberOfSteps {
        self.stepsLbl.text = String(format: "%@", steps)
    } else {
    self.stepsLbl.text = "0"
        }
    }

    
    func oneDayAgo() -> NSDate {
     let calendar =   NSCalendar.currentCalendar()
       return calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])!
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

