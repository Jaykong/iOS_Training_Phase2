//
//  ViewController.swift
//  JKK_WebKit_JS_Swift
//
//  Created by kongyunpeng on 1/24/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKNavigationDelegate,WKUIDelegate {
    var webView:WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let script = WKUserScript(source: "document.body.style.background = \"#FF0000\";", injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        
        let script = WKUserScript(source:"alert(\"Java\tScript\")", injectionTime:.AtDocumentEnd, forMainFrameOnly:true)
        let contentController = WKUserContentController()
        
        contentController.addUserScript(script)
      let webViewConfiguration = WKWebViewConfiguration()
       webViewConfiguration.userContentController = contentController
       webView = WKWebView(frame: CGRect(x: 0, y: 20, width: self.view.bounds.size.width, height: self.view.bounds.size.height), configuration: webViewConfiguration)
        
       webView.UIDelegate = self
       webView.navigationDelegate = self
      
        
       
        
        self.loadLocalHtml()
       // self.loadRemoteWeb()
        self.view.addSubview(webView)
        
        
    }

    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
         // self.webView.evaluateJavaScript("alert(\"Java\tScript\"", completionHandler: nil)
       
    }
    
    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
       print(message)
       
        completionHandler()
    }
    
    func loadRemoteWeb(){
        let url = NSURL(string:"http://www.baidu.com/")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
    }
    
    func loadLocalHtml() {
        let path = NSBundle.mainBundle().pathForResource("index", ofType: "html")
        let contents = try? String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        if contents != nil {
        webView.loadHTMLString(contents!, baseURL: nil)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

