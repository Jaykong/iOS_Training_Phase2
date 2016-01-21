//
//  Song.swift
//  JKKCocoaTableView
//
//  Created by kongyunpeng on 1/16/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import Cocoa

class Song: NSObject {
var title = "A Song"
var duration:NSTimeInterval = 0
    
    func durationString() -> String {
        return NSString(format: "%i:%02i", Int(self.duration/60),Int(self.duration%60)) as String
    }
    
}
