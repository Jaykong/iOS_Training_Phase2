//
//  AppDelegate.swift
//  Cloud
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

  
    
   
    
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let backgroundQueue = NSOperationQueue()
        backgroundQueue.addOperationWithBlock { () -> Void in
            let ubiquityContainerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)
            print("Ubiquity container URL:\(ubiquityContainerURL)")
            
        
            
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

