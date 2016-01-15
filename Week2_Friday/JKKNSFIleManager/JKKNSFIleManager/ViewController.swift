//
//  ViewController.swift
//  JKKNSFIleManager
//
//  Created by kongyunpeng on 1/15/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSFileManagerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let fileManger = NSFileManager.defaultManager()
//        let fileManager = NSFileManager()
//        fileManager.delegate = self
        
        let urls = fileManger.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentURL = urls[0]
        
        let temporaryPath = NSTemporaryDirectory()
        let temporaryURL = NSURL.fileURLWithPath(temporaryPath)
        //print(temporaryPath)
        
        do {
           try fileManger.createDirectoryAtURL(temporaryURL, withIntermediateDirectories: true, attributes: nil)
        } catch {
            
        }
        
     //try! fileManger.removeItemAtURL(temporaryURL)
      
    let newFile = temporaryPath + "/newFile"
    let someText = "create some file to save..."
    let someData = someText.dataUsingEncoding(NSUTF8StringEncoding)
    fileManger.createFileAtPath(newFile, contents: someData, attributes: nil)
    
   let jkkInDocumentDirectory = documentURL.URLByAppendingPathComponent("jkk")
       // do {
//   try fileManger.createDirectoryAtURL(jkkInDocumentDirectory, withIntermediateDirectories: false, attributes: nil)
//        } catch {
//            print(error)
//        }
        
   let newFilePathURL = NSURL(fileURLWithPath: newFile)
            do {
   try fileManger.moveItemAtURL(newFilePathURL, toURL: jkkInDocumentDirectory)
                
               
            } catch {
                print(error)
            }
   
        do {
         
            let contents = try fileManger.contentsOfDirectoryAtURL(documentURL, includingPropertiesForKeys: [NSURLFileSizeKey,NSURLContentModificationDateKey], options: [])
            
            do {
          let attributes = [NSURLFileSizeKey,NSURLContentModificationDateKey]
          let attributesDic = try documentURL.resourceValuesForKeys(attributes)
               print(attributesDic[NSURLFileSizeKey])
               print(attributesDic[NSURLContentModificationDateKey])
                
            }catch {
                print(error)
            }
            
            
          
        }
           
        catch {
            print(error)
        }
        
//       _ = try? fileManger.createDirectoryAtURL(temporaryURL, withIntermediateDirectories: false, attributes: nil)
        
        
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

