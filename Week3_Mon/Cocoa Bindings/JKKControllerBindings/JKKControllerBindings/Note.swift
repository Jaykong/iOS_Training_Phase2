//
//  Note.swift
//  JKKControllerBindings
//
//  Created by trainer on 1/18/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import Cocoa

class Note: NSObject {
    var title = "New Note"{
        didSet {
            editedDate = NSDate()
        }//在修改title值后更新editedDate
    }
    var text:NSAttributedString = NSAttributedString(string:"New Note"){
        didSet {
            editedDate = NSDate()
        }//在修改text值后更新editedDate
    }
    var createdDate = NSDate()
    
    var editedDate = NSDate()
}
