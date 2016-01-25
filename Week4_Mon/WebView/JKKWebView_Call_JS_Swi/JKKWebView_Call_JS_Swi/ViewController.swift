//
//  ViewController.swift
//  JKKWebView_Call_JS_Swi
//
//  Created by kongyunpeng on 1/23/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //"alert('Trigger the JS!');"
        let path = NSBundle.mainBundle().pathForResource("LocalHtml", ofType: "html")
        do {
        let html = try String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
            webView.delegate = self
            webView.loadHTMLString(html, baseURL: nil)
            
        } catch {print(error)}
        
      
        
        
    }
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        webView.stringByEvaluatingJavaScriptFromString("alert('Triger Java Script');")
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

