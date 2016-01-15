//
//  ViewController.swift
//  Cloud
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    //把你选取的文件拷贝到iCloud
    @IBAction func addFiles(sender: AnyObject) {
     let panel = NSOpenPanel()
     panel.beginSheetModalForWindow(self.view.window!) { (result) -> Void in
        if result == NSModalResponseOK {
            let containerURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)?.URLByAppendingPathComponent("Documents", isDirectory: true)
            if let sourceURL = panel.URL {
                
            let destinationURL = containerURL?.URLByAppendingPathComponent(sourceURL.lastPathComponent!)
               
            try!  NSFileManager.defaultManager().setUbiquitous(true, itemAtURL: sourceURL, destinationURL: destinationURL!)
            }
        }
        }
    }
   //文件存储
    dynamic var filesInCloudStorage:[NSURL] = [] //标记为dynamic，将允许Cocoa绑定来处理它
    var metadataQuery:NSMetadataQuery!
    var metadataQueryDidUpdateObserver:AnyObject?
    var metadataQueryDidFinishGatheringObserver:AnyObject?
    //创建一个元组数据查询对象：用断言限制查找在无处不在的容器的Documents下的所有文件名，此时数据还未查询
    func createMetadataQuery() {
        metadataQuery = NSMetadataQuery()
        metadataQuery.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        metadataQuery.predicate = NSPredicate(format: "%K LIKE '*'", NSMetadataItemFSNameKey)
    }
    //把查询的结果转换成一个url数组并赋值给一个实例变量filesInCloudStorage
    func queryDidUpdate() {
        var urls:[NSURL] = []
        for item in metadataQuery.results {
            let url = item.valueForAttribute(NSMetadataItemURLKey) as! NSURL
            urls.append(url)
        }
        self.filesInCloudStorage = urls
    }
    //增加一个元组数据完成对文件夹改变内容后的通知，此元组数据是检查无处不在容器的Documents内容
    func createMetadataQueryDidUpdateObserver() {
        NSNotificationCenter.defaultCenter().addObserverForName(NSMetadataQueryDidUpdateNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            self.queryDidUpdate()
        }
    }
    //增加一个元组数据完成对文件夹的初次扫描的通知
    func createMetadataQueryDidFinishGatheringObserver() {
        NSNotificationCenter.defaultCenter().addObserverForName(NSMetadataQueryDidFinishGatheringNotification, object: nil, queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
            self.queryDidUpdate()
        }
    }
   //键值对
   //计算属性
    var cloudString:String? {
        get {
        return NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        }
        set {
            NSUbiquitousKeyValueStore.defaultStore().setString(newValue, forKey: "cloud_string")
            NSUbiquitousKeyValueStore.defaultStore().synchronize()
            //立即将内存中本地副本同步到磁盘
        }
    }
    
    
    var storeChangeObserver:AnyObject? = nil
    //接受无处不在远程的通知，并更改text field的值
    func createStoreChangeObserver() {
        self.storeChangeObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: self, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            self.willChangeValueForKey("cloudString")
            self.didChangeValueForKey("cloudString")
        });
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.createStoreChangeObserver()
       
        
        self.createMetadataQuery()
        self.createMetadataQueryDidFinishGatheringObserver()
        self.createMetadataQueryDidUpdateObserver()
        self.metadataQuery.startQuery()
        
        
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

