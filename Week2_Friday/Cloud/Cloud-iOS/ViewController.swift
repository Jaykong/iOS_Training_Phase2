//
//  ViewController.swift
//  Cloud-iOS
//
//  Created by kongyunpeng on 1/9/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIDocumentPickerDelegate {

    
    var filesInCloudStorage:[NSURL] = []
    
    var keyValueStoreDidChangeObserver:AnyObject?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var jkTableView: UITableView!
   
 
   
    //添加元组查询类
    var metadataQuery:NSMetadataQuery!
    var queryDidFinishGatheringObserver:AnyObject?
    var queryDidUpdateObserver:AnyObject?
    
    func createMetadataQuery() {
        metadataQuery = NSMetadataQuery()
        metadataQuery.searchScopes = [NSMetadataQueryUbiquitousDocumentsScope]
        metadataQuery.predicate = NSPredicate(format: "%K LIKE '*'", NSMetadataItemFSNameKey)
    }
    
    func queryUpdated() {
        var files:[NSURL] = []
        for item in metadataQuery.results {
       let url = item.valueForAttribute(NSMetadataItemURLKey) as! NSURL
            files.append(url)
        }
        self.filesInCloudStorage = files
        jkTableView.reloadData()
        
    }
    func createQueryDidFinishGatheringObserver() {
        self.queryDidFinishGatheringObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSMetadataQueryDidFinishGatheringNotification, object: metadataQuery, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            self.queryUpdated()
        })
    }
    func createQueryDidUpdateObserver(){
        self.queryDidUpdateObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSMetadataQueryDidUpdateNotification, object: metadataQuery, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
            self.queryUpdated()
        })
    }
    
    override func viewDidLoad() {
       super.viewDidLoad()
      
       self.textField.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
        //键值
       self.keyValueStoreDidChangeObserver = NSNotificationCenter.defaultCenter().addObserverForName(NSUbiquitousKeyValueStoreDidChangeExternallyNotification, object: self, queue: NSOperationQueue.mainQueue(), usingBlock: { (notification) -> Void in
         self.textField.text = NSUbiquitousKeyValueStore.defaultStore().stringForKey("cloud_string")
       })
        
        
        self.createMetadataQuery()
        self.createQueryDidFinishGatheringObserver()
        self.createQueryDidUpdateObserver()
        self.metadataQuery.startQuery()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
      
        self.textField.resignFirstResponder()
        NSUbiquitousKeyValueStore.defaultStore().setString(self.textField.text, forKey: "cloud_string")
        
        return false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//MARK: Table view dataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filesInCloudStorage.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
        cell?.textLabel?.text = filesInCloudStorage[indexPath.row].description
        cell?.textLabel?.numberOfLines = 0
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    
   //MARK:UIDocumentPickerDelegate
    
    var documentSelector:UIDocumentPickerViewController?
    
    @IBAction func addFiles(sender:AnyObject) {
        
        documentSelector = UIDocumentPickerViewController(documentTypes: ["public.data"], inMode: UIDocumentPickerMode.Import)
        documentSelector?.delegate = self
        
        self.presentViewController(documentSelector!, animated: true, completion: nil)
    }
    
    func documentPicker(controller: UIDocumentPickerViewController, didPickDocumentAtURL url: NSURL) {
        url.startAccessingSecurityScopedResource()
        let fileName = url.lastPathComponent
      
        let temporaryURL = NSURL.fileURLWithPath(NSTemporaryDirectory(),isDirectory: true).URLByAppendingPathComponent(fileName!, isDirectory: false)
        
        
        func copyItemAtURLWhenExistes() {
        guard NSFileManager.defaultManager().fileExistsAtPath(temporaryURL.path!) else {
             try! NSFileManager.defaultManager().copyItemAtURL(url, toURL: temporaryURL)
            return
          }
        }
      
        copyItemAtURLWhenExistes()
        url.stopAccessingSecurityScopedResource()
       
    let destinationURL = NSFileManager.defaultManager().URLForUbiquityContainerIdentifier(nil)?.URLByAppendingPathComponent("Documents").URLByAppendingPathComponent(fileName!, isDirectory: false)
        
    if  NSFileManager.defaultManager().fileExistsAtPath((destinationURL?.path!)!) {
                
        do {
            try NSFileManager.defaultManager().setUbiquitous(false, itemAtURL: temporaryURL, destinationURL: destinationURL!)
        } catch {
            print(error)
        }

    } else {
        do {
            try NSFileManager.defaultManager().setUbiquitous(true, itemAtURL: temporaryURL, destinationURL: destinationURL!)
        } catch {
            print(error)
        }

    }
        
       
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    func documentPickerWasCancelled(controller: UIDocumentPickerViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}

