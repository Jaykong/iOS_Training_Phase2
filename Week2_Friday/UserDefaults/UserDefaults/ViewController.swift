//
//  ViewController.swift
//  UserDefaults
//
//  Created by kongyunpeng on 1/14/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
     let defaults = NSUserDefaults.standardUserDefaults()
     let myDefaults = ["greeting":"hello","numberOfItems":1]
     // defaults.registerDefaults(myDefaults)
        
    print(defaults.objectForKey("greeting"))
    defaults.setObject(NSDate(), forKey:"date")
    print(defaults.objectForKey("date"))
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

