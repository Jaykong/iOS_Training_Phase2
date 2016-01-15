//
//  AppDelegate.swift
//  SandBoxOS
//
//  Created by kongyunpeng on 1/15/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let panel = NSOpenPanel()
        panel.canChooseDirectories = true
        panel.canChooseFiles = true
        panel.beginWithCompletionHandler { (result) -> Void in
            let selectedURL = panel.URL
        
           
            //创建、保存书签
            let fileManager = NSFileManager.defaultManager()
            let documentURL = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
            print(documentURL)
            let bookmarkStorageURL = documentURL.URLByAppendingPathComponent("savedbookmark.bookmark")
            do {
            let bookmarkData =  try selectedURL?.bookmarkDataWithOptions(.WithSecurityScope, includingResourceValuesForKeys: nil, relativeToURL: nil)
                
                bookmarkData?.writeToURL(bookmarkStorageURL, atomically: true)
            } catch {
               print(error)
            }
            
           //提取保存的书签
            
            let loadedBookmarkData = NSData(contentsOfURL: bookmarkStorageURL)
            var loadedBookmark:NSURL?
            if loadedBookmarkData?.length > 0 {
                do {
                loadedBookmark = try NSURL(byResolvingBookmarkData: loadedBookmarkData!, options: NSURLBookmarkResolutionOptions.WithSecurityScope, relativeToURL: nil, bookmarkDataIsStale: nil)
                    print(loadedBookmark)
                } catch {
                    print(error)
                }

            }
            
        }
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

