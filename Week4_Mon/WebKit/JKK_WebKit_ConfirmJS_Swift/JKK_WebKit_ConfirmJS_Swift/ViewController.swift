//
//  ViewController.swift
//  JKK_WebKit_ConfirmJS_Swift
//
//  Created by kongyunpeng on 1/25/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKUIDelegate {

    var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.loadLocalHtml()
       
    }

    
    func addConstraints() {
        let viewMap = ["webView":webView]
        let metrics = ["top":20]
        
       
       
        let horizontals = NSLayoutConstraint.constraintsWithVisualFormat("|-[webView]-|", options: [], metrics: nil, views: viewMap)
        
        
        let veticals = NSLayoutConstraint.constraintsWithVisualFormat("V:|-top-[webView]-|", options: [], metrics: metrics, views: viewMap)
        
        self.view.addConstraints(horizontals + veticals)
        
    }
    
    func loadLocalHtml() {
        let path = NSBundle.mainBundle().pathForResource("confirm", ofType: "html")
        let contents = try! String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        webView = WKWebView(frame: self.view.bounds)
        
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        webView.loadHTMLString(contents, baseURL: nil)
        self.view.addSubview(webView)
        self.addConstraints()
        webView.UIDelegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        
        let alertController = UIAlertController(title: "Webkit", message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (_) -> Void in
            completionHandler()
        }
        alertController.addAction(okAction)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    
    func webView(webView: WKWebView, runJavaScriptConfirmPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: (Bool) -> Void) {
        let alertController = UIAlertController(title: "Webkit", message: message, preferredStyle: .Alert)
        let okAction = UIAlertAction(title: "OK", style: .Default) { (_) -> Void in
            completionHandler(true)
        }
        
        let cancelAct = UIAlertAction(title: "Cancel", style: .Cancel) { (_) -> Void in
            completionHandler(true)
        }
        alertController.addAction(okAction)
        alertController.addAction(cancelAct)
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }
    
    
    func webView(webView: WKWebView, runJavaScriptTextInputPanelWithPrompt prompt: String, let defaultText: String?, initiatedByFrame frame: WKFrameInfo, completionHandler: (String?) -> Void) {
        
        let alertController = UIAlertController(title: "Webkit", message: prompt, preferredStyle: .Alert)
       
       alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
        textField.text = defaultText
        }
        
        let okAction = UIAlertAction(title: "OK", style: .Default) { (ac) -> Void in
           
         completionHandler(alertController.textFields![0].text)
        }
        
        
        alertController.addAction(okAction)
     
        self.presentViewController(alertController, animated: true, completion: nil)
        

        
        
    }

}

