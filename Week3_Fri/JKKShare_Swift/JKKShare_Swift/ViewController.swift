//
//  ViewController.swift
//  JKKShare_Swift
//
//  Created by trainer on 1/22/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!

    @IBAction func shareImage(sender: AnyObject) {
        if let image = imageView.image {
            let activityController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            self.presentViewController(activityController, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func shareText(sender: AnyObject) {
        let text = "text to share"
        let activityController = UIActivityViewController(activityItems: [text], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

