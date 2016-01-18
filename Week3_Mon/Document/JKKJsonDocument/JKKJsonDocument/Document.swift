//
//  Document.swift
//  JKKJsonDocument
//
//  Created by trainer on 1/18/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    var text = ""
    var checked = true
    @IBOutlet weak var checkedBtn: NSButton!
    @IBOutlet weak var textField: NSTextField!
    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override func windowControllerDidLoadNib(aController: NSWindowController) {
        super.windowControllerDidLoadNib(aController)
        self.textField.stringValue = self.text
        self.checkedBtn.integerValue = Int(self.checked)
        
    }

    override class func autosavesInPlace() -> Bool {
        return true
    }

    override var windowNibName: String? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return "Document"
    }

    override func dataOfType(typeName: String) throws -> NSData {
        // Insert code here to write your document to data of the specified type. If outError != nil, ensure that you create and set an appropriate error when returning nil.
        // You can also choose to override fileWrapperOfType:error:, writeToURL:ofType:error:, or writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
        //throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        let dic = ["text":self.textField.stringValue,"checked":self.checkedBtn.integerValue]
        
        let jsonData = try! NSJSONSerialization.dataWithJSONObject(dic, options: [])
        return jsonData
        
    }

    override func readFromData(data: NSData, ofType typeName: String) throws {
   let dic = try! NSJSONSerialization.JSONObjectWithData(data, options: [])
        
    self.text = dic["text"] as! String
    let value = dic["checked"] as! Int
    self.checked = Bool(value)
        
    }


}

