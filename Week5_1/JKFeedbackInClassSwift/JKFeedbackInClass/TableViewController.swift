//
//  TableViewController.swift
//  JKFeedbackInClass
//
//  Created by trainer on 2/17/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController,UITextFieldDelegate,UITextViewDelegate {
    @IBAction func submit(sender: AnyObject) {
    print(tel)
    print(qq)
    print(mail)
    print(contents)
        
    PostFeedback.postData(tel, qq: qq, mail: mail, contents: contents)
        
    }
    let contacts = ["电话","QQ","邮件"]
    var tel = ""
    var qq = ""
    var mail = ""
    var contents = ""
    
    //MARK: Text Field Delegate
    func textFieldDidEndEditing(textField: UITextField) {
        switch textField.tag {
        case 0:
            tel = textField.text!
        case 1:
            qq = textField.text!
        case 2:
            mail = textField.text!
        default:
            break
        }
    }
    //MARK: TextView Delegate 
    func textViewDidEndEditing(textView: UITextView) {
        contents = textView.text
    }
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section  {
        case 0 :
            return contacts.count
        case 1 :
            return 1
        case 2:
            return 1
        default:
            return 1
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0  {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("LblTextfiledCell", forIndexPath: indexPath) as! LblTextfieldCell
        cell.lbl.text = contacts[indexPath.row]
        return cell
      }
        
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCellWithIdentifier("TextViewCell", forIndexPath: indexPath) as! TextViewCell
           cell.textfield.text = ""
            return cell
        }
        if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCellWithIdentifier("ButtonCell", forIndexPath: indexPath) as! ButtonCell
            
            return cell
        }
        
    let cell = tableView.dequeueReusableCellWithIdentifier("TextViewCell", forIndexPath: indexPath)
        return cell
        
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44
        }
        
        if indexPath.section == 1 {
            return 100
        }
        
        return 44
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
