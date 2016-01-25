//
//  ViewController.swift
//  JKK_WebView_Local_Swift
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webView:UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
       let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
       let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
       webView.loadHTMLString(contents, baseURL: NSURL(string: path!))
       // file://
       webView.delegate = self
    }

    func webViewDidFinishLoad(webView: UIWebView) {
//webView.stringByEvaluatingJavaScriptFromString("alert(\"hello,js\")")
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
       
    let url = request.URL!
       print(url.scheme)
       print(url.absoluteString)
        if url.scheme == "callmycode" {
      let urlParts = url
        .absoluteString.componentsSeparatedByString(":")
      print(urlParts)
     let names = urlParts[1].componentsSeparatedByString("&")
     let methodName = names[0]
     let varName = names[1]
     let controller = UIAlertController(title: "JS says", message: methodName + varName, preferredStyle: .Alert)
     let action = UIAlertAction(title: "ok", style: .Default) { (_) -> Void in
            self.dismissViewControllerAnimated(false, completion: nil)
        }
     controller.addAction(action)
     self.presentViewController(controller, animated: false, completion: nil)
        }
        
        
        
        
        
        
        
        
        
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

