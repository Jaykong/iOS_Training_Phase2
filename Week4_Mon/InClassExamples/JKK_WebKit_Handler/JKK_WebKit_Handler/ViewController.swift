//
//  ViewController.swift
//  JKK_WebKit_Handler
//
//  Created by trainer on 1/25/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,WKScriptMessageHandler {

    var jkkWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userScript = WKUserScript(source: "", injectionTime: .AtDocumentEnd, forMainFrameOnly: false)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        userContentController.addScriptMessageHandler(self, name: "ZZXX")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        jkkWebView = WKWebView(frame: self.view.bounds, configuration: configuration)
        self.view.addSubview(jkkWebView)
        let url = NSURL(string: "http://www.baidu.com")
        
        jkkWebView.loadRequest(NSURLRequest(URL: url!))
        
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}


typealias wKScriptMessageHandler = ViewController
extension wKScriptMessageHandler {
    func userContentController(userContentController: WKUserContentController, didReceiveScriptMessage message: WKScriptMessage) {
        //window.webkit.messageHandlers.ZZXX.postMessage("")

      print(message.body)
      print(message.name)
        
        let dic = message.body as! Dictionary<String,String>
        let className = dic["className"]
        let methodName = dic["method"]
     let bundleKey =  NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleName") as! String
      let classNamePath = className! + "." + bundleKey
     let ClsName = NSClassFromString(classNamePath) as! NSObject.Type
        
     let aClassInstance = ClsName.init()
      let aClassMethod = Selector(methodName!)
        
    aClassInstance.performSelector(aClassMethod)
        
     
        
    }
}



