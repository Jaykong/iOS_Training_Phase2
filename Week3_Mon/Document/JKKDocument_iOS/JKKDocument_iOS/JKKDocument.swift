//
//  JKKDocument.swift
//  JKKDocument_iOS
//
//  Created by trainer on 1/18/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class JKKDocument: UIDocument {
    var text = ""
    override func loadFromContents(contents: AnyObject, ofType typeName: String?) throws {
      
        self.text = String(data: contents as! NSData, encoding: NSUTF8StringEncoding)!
    }
    
  override func contentsForType(typeName: String) throws -> AnyObject {
    return  self.text.dataUsingEncoding(NSUTF8StringEncoding)!
    }
    
}
