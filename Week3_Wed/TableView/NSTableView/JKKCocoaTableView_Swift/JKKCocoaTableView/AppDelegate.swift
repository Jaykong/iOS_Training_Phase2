//
//  AppDelegate.swift
//  JKKCocoaTableView
//
//  Created by kongyunpeng on 1/16/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,NSTableViewDelegate,NSTableViewDataSource {
    var songs:[Song] = []
    @IBOutlet weak var songsController: NSArrayController!
    @IBOutlet weak var window: NSWindow!

    override func awakeFromNib() {
        if self.songs.count == 0 {
            var aSong:Song!
            aSong = Song()
            aSong.title = "Who are you"
            aSong.duration = 289
            //self.songsController.addObject(aSong)
            songs.append(aSong)
            aSong = Song()
            aSong.title = "I am panda"
            aSong.duration = 143
            //self.songsController.addObject(aSong)
            songs.append(aSong)

            aSong = Song()
            aSong.title = "Who are you"
            aSong.duration = 188
            //self.songsController.addObject(aSong)
            songs.append(aSong)

            aSong = Song()
            aSong.title = "I am pig"
            aSong.duration = 432
            //self.songsController.addObject(aSong)
            songs.append(aSong)

        }
    }
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        
        return self.songs.count
    }
    
   
    func tableView(tableView: NSTableView, viewForTableColumn tableColumn: NSTableColumn?, row: Int) -> NSView? {
       
        let cell = tableView.makeViewWithIdentifier((tableColumn?.identifier)!, owner: self) as! NSTableCellView
        let textField = cell.textField
        let song = self.songs[row]
        if tableColumn?.identifier == "Title" {
          textField?.stringValue = song.title
        } else if tableColumn?.identifier == "Duration" {
            let durationText = NSString(format: "%i:%02i", Int(song.duration/60),Int(song.duration%60))
            textField?.stringValue = durationText as String
        }
       return cell
    }


    func tableView(tableView: NSTableView, sortDescriptorsDidChange oldDescriptors: [NSSortDescriptor]) {
        for sortDescriptor in tableView.sortDescriptors.reverse()  as [NSSortDescriptor]{
           songs = songs.sort({ (item1, item2) -> Bool in
              let result = sortDescriptor.compareObject(item1, toObject: item2)
                return result == NSComparisonResult.OrderedDescending
            })
//            songs.sortInPlace(){ (item1, item2) -> Bool in
//              let result =  sortDescriptor.compareObject(item1, toObject: item2) as NSComparisonResult
//               
//                
//                return result == NSComparisonResult.OrderedAscending
//            }
        }
      tableView.reloadData()
    }
    
   
}

