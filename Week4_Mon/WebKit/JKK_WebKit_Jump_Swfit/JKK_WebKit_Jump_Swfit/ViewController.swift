//
//  ViewController.swift
//  JKK_WebKit_Jump_Swfit
//
//  Created by kongyunpeng on 1/25/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {
    var jkkWebView : WKWebView!
    var jkkToolbar :UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.loadRemoteWeb()
        self.addToolbar()
        self.addConstraints()
        
        
    }

    func lastAction() {
        if jkkWebView.canGoBack {
        jkkWebView.goBack()
         
        }
    }
    
    func nextAction() {
       jkkWebView.goForward()
       
    }
    
    func refresh() {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        jkkWebView.reload()
    }
    func addToolbar() {
        jkkToolbar = UIToolbar()
        let lastItem = UIBarButtonItem(title: "last", style: .Plain, target: self, action: "lastAction")
        let nextItem = UIBarButtonItem(title: "next", style: .Plain, target: self, action: "nextAction")
        let refresh = UIBarButtonItem(title: "refresh", style: .Plain, target: self, action: "refresh")
        jkkToolbar.setItems([lastItem,nextItem,refresh], animated: true)

        self.view.addSubview(jkkToolbar)
    }
    
    func addConstraints() {
        jkkWebView.translatesAutoresizingMaskIntoConstraints = false
        jkkToolbar.translatesAutoresizingMaskIntoConstraints = false
        
        let viewMap = ["jkkToolbar":jkkToolbar,"jkkWebView":jkkWebView]
        var tBarHoris = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[jkkToolbar]-|", options: [], metrics: nil, views: viewMap)
         tBarHoris += NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-20-[jkkWebView][jkkToolbar]-|", options: [], metrics: nil, views: viewMap)
        
        tBarHoris += NSLayoutConstraint.constraintsWithVisualFormat("H:|-[jkkWebView]-|", options: [], metrics: nil, views: viewMap)
        self.view.addConstraints(tBarHoris)
        
        
    }
    
    func loadRemoteWeb() {
     let url = NSURL(string:"http://www.jianshu.com/p/3d7e4804033b")
     let request = NSURLRequest(URL: url!)
        jkkWebView = WKWebView(frame: self.view.bounds)
        self.view.addSubview(jkkWebView)
        jkkWebView.loadRequest(request)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

