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
       // self.testXML()
        writeXML()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func writeXML() {
   let rootNode = GDataXMLElement.elementWithName("Users")
     let userNode = GDataXMLElement.elementWithName("User")
     let userAttri =  GDataXMLNode.attributeWithName("id", stringValue: "101") as! GDataXMLNode
     userNode.addAttribute(userAttri)
     
        let nameNode = GDataXMLNode.elementWithName("name",stringValue: "航歌")
        userNode.addChild(nameNode)
        
        let telNode = GDataXMLNode.elementWithName("tel")
        
            let mobileNode = GDataXMLNode.elementWithName("mobile",stringValue: "1234567")
            let homeNode = GDataXMLNode.elementWithName("home",stringValue: "025-8100000")
            telNode.addChild(mobileNode)
            telNode.addChild(homeNode)
            userNode.addChild(telNode)
       rootNode.addChild(userNode)
        
        
   let doc = GDataXMLDocument(rootElement: rootNode)
        doc.setCharacterEncoding("utf-8")
   let docXML = String(data: doc.XMLData(), encoding: NSUTF8StringEncoding)
    
    print(docXML)
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

