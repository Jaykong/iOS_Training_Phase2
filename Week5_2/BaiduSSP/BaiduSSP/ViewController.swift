//
//  ViewController.swift
//  BaiduSSP
//
//  Created by kongyunpeng on 2/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,BaiduMobAdViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        addBaiduAd()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func addBaiduAd() {
        
      let adView = BaiduMobAdView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 44))
       adView.AdUnitTag = "2071088"
       adView.AdType = BaiduMobAdViewTypeBanner
       adView.delegate = self;
       self.view.addSubview(adView)
       adView.start()
    }

    func publisherId() -> String! {
        return "b0d091df"
    }
}

