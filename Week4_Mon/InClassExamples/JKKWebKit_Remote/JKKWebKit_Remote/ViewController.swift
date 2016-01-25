//
//  ViewController.swift
//  JKKWebKit_Remote
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKNavigationDelegate {
    var wkWebView:WKWebView!
    var progressView:UIProgressView!
    
    func addProgessView() {
        progressView = UIProgressView()
        progressView.tintColor = UIColor.redColor()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(progressView)
    }
    
    func addWkWebView() {
     wkWebView = WKWebView(frame: CGRectZero)
     wkWebView.translatesAutoresizingMaskIntoConstraints = false
     self.view.addSubview(wkWebView)
     self.addProgessView()
     self.addWkContraints()
    }
    func addWkContraints() {
        let viewMap = ["wkWebView":wkWebView,"progressView":progressView]
        let metrics = ["top":20,"space":0]
        
        var contraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-space-[wkWebView]-space-|", options: [], metrics: metrics, views: viewMap)
        contraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|-top-[progressView]-top-[wkWebView]-|", options: [], metrics: metrics, views: viewMap)
        contraints += NSLayoutConstraint.constraintsWithVisualFormat("H:|-0-[progressView]-space-|", options: [], metrics: metrics, views: viewMap)
       self.view.addConstraints(contraints)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = NSURL(string: "http://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        self.addWkWebView()
        wkWebView.loadRequest(request)
        
        wkWebView.addObserver(self, forKeyPath: "estimatedProgress", options: .New, context: nil)
        wkWebView.navigationDelegate = self
    }

  override  func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
     progressView.setProgress(Float(wkWebView.estimatedProgress), animated: true)
    
    }
    
    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
        progressView.hidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

