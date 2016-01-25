//
//  ViewController.swift
//  JKK_WebKit_Handler_Swift
//
//  Created by kongyunpeng on 1/24/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler{
    var webView :WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";
        
        //window.webkit.messageHandlers.OOXX.postMessage({className: "Callme", functionName: "maybe"})
     let script = WKUserScript(source: "window.webkit.messageHandlers.ZZXX.postMessage({className:\"Person\",method:\"showName\"})", injectionTime: .AtDocumentStart, forMainFrameOnly: false)
        
     let contentController = WKUserContentController()
     
    let configuration = WKWebViewConfiguration()
        configuration.userContentController = contentController
        
        contentController.addScriptMessageHandler(self, name: "ZZXX")
        contentController.addUserScript(script)
        webView = WKWebView(frame: CGRectMake(0, 20, self.view.bounds.width, self.view.bounds.height), configuration:configuration)
        
        let url = NSURL(string: "https://lvwenhan.com/ios/461.html")
        let request = NSURLRequest(URL: url!)
        webView.loadRequest(request)
        webView.UIDelegate = self
        webView.navigationDelegate = self
        self.view.addSubview(webView)
//        webView.evaluateJavaScript("var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);") { (anything, error) -> Void in
//            print(anything)
//            print(error)
        //}
    
    }
    
//    func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
//        
//        webView.evaluateJavaScript("navigator.userAgent") { (anything, error) -> Void in
//            print(anything)
//            print(error)
//        }
//    }
    

    func webView(webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: () -> Void) {
        let alertViewController = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
     let action = UIAlertAction(title: "ok", style: .Default) { (action) -> Void in
             completionHandler()
        
        }
        
    alertViewController.addAction(action)
    self.presentViewController(alertViewController, animated: false, completion: nil)
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
}

extension ViewController {
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        if message.name == "ZZXX" {
            //window.webkit.messageHandlers.ZZXX.postmesage({className:"Person",method:"showName"})
            let personDic = message.body as! Dictionary<String,String>
            print(personDic["className"])
            print(personDic["method"])
            let person = personDic["className"]!
            let showName = personDic["method"]!
           // let cls = NSClassFromString(person)
           // print(cls)
         let bundleName = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName")!.description
            
         let personType = bundleName + "." + person
            print(personType)
         let PersonCls = NSClassFromString(personType) as! NSObject.Type
            print(PersonCls)
        
            
            
          let aPerson = PersonCls.init()
          let showMe = Selector(showName)
          aPerson.performSelector(showMe)
            
        }
        
        print(message.body)
    }
    
}
