//
//  MasterViewController.swift
//  JKKDocument_iOS
//
//  Created by trainer on 1/18/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var documentURLs = [NSURL]()
   private let fileManager = NSFileManager.defaultManager()
   private func documentURL() -> NSURL {
    
     let urls = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        return urls[0]
    }

    func updateDocumentURLs() {
        do {
        self.documentURLs = try fileManager.contentsOfDirectoryAtURL(self.documentURL(), includingPropertiesForKeys: nil, options: .SkipsHiddenFiles)
        }catch {print(error)}
    }

    override func viewWillAppear(animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.collapsed
        
        super.viewWillAppear(animated)
        self.updateDocumentURLs()
        self.tableView.reloadData()

    }
    
    func formatDate() -> String {
        let dateFormater = NSDateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd HH:mm:ssZZZ"
      return dateFormater.stringFromDate(NSDate())
    }
    
    func insertNewObject(sender: AnyObject) {
    let url = self.documentURL().URLByAppendingPathComponent(self.formatDate())
    let documentToCreate = JKKDocument(fileURL: url)
     documentToCreate.saveToURL(url, forSaveOperation:.ForCreating) { (success) -> Void in
        if success {
        self.performSegueWithIdentifier("showDetail", sender: documentToCreate)
         }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.documentURL())
        self.navigationItem.leftBarButtonItem = self.editButtonItem()

        let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

  //MARK:TableView Delegate
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       let documentToOpen = JKKDocument(fileURL: documentURLs[indexPath.row])
        documentToOpen.openWithCompletionHandler { (success) -> Void in
            if success {
    self.performSegueWithIdentifier("showDetail", sender: documentToOpen)
            }
        }
        
    }
    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = sender as! JKKDocument
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.documentURLs.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        let url = self.documentURLs[indexPath.row]
        cell.textLabel!.text = url.lastPathComponent
        return cell
    }

}

