//
//  ViewController.swift
//  GDataXML
//
//  Created by kongyunpeng on 2/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.testXML()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func testXML() {
        let path = NSBundle.mainBundle().pathForResource("users", ofType: "xml")
        let xmlData = NSData(contentsOfFile: path!)
        
     let doc = try! GDataXMLDocument(data: xmlData, options: 0)
        
     let users = try! doc.nodesForXPath("//User")
        
        for user in users {
         let uid = user.attributeForName("id").stringValue()
            
         let nameEle = user.elementsForName("name")[0]
         let uname = nameEle.stringValue!
         
         let telElement = user.elementsForName("tel")[0]
            let mobileElement = telElement.elementsForName("mobile")[0]
            let mobile = mobileElement.stringValue!
            
            let homeElement = telElement.elementsForName("home")[0]
            let home = homeElement.stringValue!
            
            print(uid,uname,mobile,home)
            
        }
        
        
        
    }

}

