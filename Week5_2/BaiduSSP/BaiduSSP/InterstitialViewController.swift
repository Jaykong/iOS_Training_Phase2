//
//  InterstitialViewController.swift
//  BaiduSSP
//
//  Created by kongyunpeng on 2/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class InterstitialViewController: UIViewController,BaiduMobAdInterstitialDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
      addInterStitialAd()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func publisherId() -> String! {
        return "b0d091df"
    }
    
    let adView = BaiduMobAdInterstitial()
    func addInterStitialAd() {
        
        adView.AdUnitTag = "2071090"
        adView.interstitialType = BaiduMobAdViewTypeInterstitialOther
        adView.delegate = self
        adView.load()
        
            }
    @IBAction func show(sender: AnyObject) {
        if adView.isReady {
            adView.presentFromRootViewController(self)
        }
        adView.load()

    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
