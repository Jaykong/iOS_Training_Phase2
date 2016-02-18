//
//  PostFeedback.swift
//  JKFeedbackInClass
//
//  Created by trainer on 2/17/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class PostFeedback: NSObject {
   class func postData(tel:String,qq:String,mail:String,contents:String) {
      let session = NSURLSession.sharedSession()
      let url = NSURL(string: "http://112.124.122.38/acountingExam/feedback.php")
      let request = NSMutableURLRequest(URL: url!)
     let para = String(format: "qq=%@&tel=%@&email=%@&content=%@",qq,tel,mail,contents)
      request.HTTPMethod = "POST"
      request.HTTPBody = para.dataUsingEncoding(NSUTF8StringEncoding)
     let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
        let receivedStr = String(data: data!, encoding: NSUTF8StringEncoding)
        print(receivedStr)
        }
        task.resume()
    }
    

    
}
