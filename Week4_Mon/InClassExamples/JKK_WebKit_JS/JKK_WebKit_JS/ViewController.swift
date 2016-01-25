//
//  ViewController.swift
//  JKK_WebKit_JS
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKUIDelegate {
    var jkkWebView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        jkkWebView = WKWebView(frame: self.view.bounds)
        jkkWebView.loadHTMLString(contents, baseURL: nil)
        self.view.addSubview(jkkWebView)
        jkkWebView.UIDelegate = self
    }

    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let alertController = UIAlertController(title: "Java Script", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {(ac) -> Void in
            completionHandler()
            })
        alertController.addAction(action)
        self.presentViewController(alertController, animated: true, completion: nil)
}

    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        let alertController = UIAlertController(title: "Java Script Confirm", message: message, preferredStyle: .Alert)
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {(ac) -> Void in
            completionHandler(true)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: {(ac) -> Void in
            completionHandler(false)
        })
        
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
      
        
        let alertController = UIAlertController(title: prompt, message: defaultText, preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
           textField.text = defaultText
        }
        
        
        let action = UIAlertAction(title: "OK", style: .Default, handler: {(ac) -> Void in
            completionHandler(alertController.textFields![0].text)
        })
        
        
        alertController.addAction(action)
        
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
        
    }
    
    
}

