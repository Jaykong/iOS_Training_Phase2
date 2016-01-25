//
//  ViewController.swift
//  JKKWebView_Remote_Swift
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
      
        let url = NSURL(string:"http://www.baidu.com")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.delegate = self
        
    }

    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        print("shouldStartLoadWithRequest")
        return true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print(__FUNCTION__)
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print(__FUNCTION__)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print(__FUNCTION__)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

