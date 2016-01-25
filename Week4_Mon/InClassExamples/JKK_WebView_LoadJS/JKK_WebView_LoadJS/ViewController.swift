//
//  ViewController.swift
//  JKK_WebView_LoadJS
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        webView.loadHTMLString(contents, baseURL: nil)
        webView.delegate = self
        
        
        
        
    }
    func webViewDidFinishLoad(webView: UIWebView) {
        
        let path = NSBundle.mainBundle().pathForResource("File", ofType: "js")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        webView.stringByEvaluatingJavaScriptFromString("document.getElementById('head2Id').innerHTML(\"wow, you changed\");")
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

