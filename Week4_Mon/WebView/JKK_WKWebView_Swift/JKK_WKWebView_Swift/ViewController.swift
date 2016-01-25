//
//  ViewController.swift
//  JKK_WKWebView_Swift
//
//  Created by kongyunpeng on 1/23/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    webView = WKWebView(frame: self.view.bounds)
        
    self.view.addSubview(webView)
    let path = NSBundle.mainBundle().pathForResource("LocalHtml", ofType: "html")
    //let url = NSURL(fileURLWithPath: path!)
    let contents = try? String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        if (contents != nil) {
         
         webView.loadHTMLString(contents!, baseURL: nil)
         webView.evaluateJavaScript("alert", completionHandler: nil)
        }
        
     
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

