//
//  BeforeVidioViewController.swift
//  BaiduSSP
//
//  Created by trainer on 2/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class BeforeVidioViewController: UIViewController,BaiduMobAdInterstitialDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
     beforeVideoAd()
        // Do any additional setup after loading the view.
    }
    func publisherId() -> String! {
        return "b0d091df"
    }
   
    @IBAction func show(sender: AnyObject) {
         //vidioAdView.presentFromView(self.view)
       vidioAdView.loadUsingSize(CGRect(x: 0, y: 0, width: 300, height: 300))
    }
    
    @IBOutlet weak var button: UIButton!
    
    func interstitialSuccessToLoadAd(interstitial: BaiduMobAdInterstitial!) {
        let customView = UIView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
        self.view.addSubview(customView)
    self.view.bringSubviewToFront(button)
      vidioAdView.presentFromView(customView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     let vidioAdView = BaiduMobAdInterstitial()
    func beforeVideoAd() {
       
        vidioAdView.delegate = self
        vidioAdView.AdUnitTag = " 2071090"
        vidioAdView.interstitialType = BaiduMobAdViewTypeInterstitialBeforeVideo
        vidioAdView.loadUsingSize(CGRect(x: 0, y: 0, width: 300, height: 300))
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
