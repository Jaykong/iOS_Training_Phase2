//
//  ViewController.swift
//  JKKChatroomInClass
//
//  Created by trainer on 1/20/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit
import MultipeerConnectivity
class ViewController: UIViewController,MCBrowserViewControllerDelegate,MCSessionDelegate {

    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func sendMsg(sender: AnyObject) {
        do {
       try session.sendData((self.textField.text?.dataUsingEncoding(NSUTF8StringEncoding))!, toPeers: session.connectedPeers, withMode: .Unreliable)
        } catch {
            print(error)
        }
        self.updateChat(self.textField.text!, fromPeer: self.peerID)
        self.textField.text = ""
    }
    
    
    @IBAction func browse(sender: AnyObject) {
        self.presentViewController(browserViewController, animated: true, completion: nil)
        
    }
    let serviceType = "Class-Chatroom"
    var peerID:MCPeerID!
    var session:MCSession!
    var browserViewController:MCBrowserViewController!
    var assistant:MCAdvertiserAssistant!
    override func viewDidLoad() {
        super.viewDidLoad()
       peerID = MCPeerID(displayName: "JayKong")
       session = MCSession(peer: peerID)
       session.delegate = self
    browserViewController = MCBrowserViewController(serviceType: serviceType, session: session)
        browserViewController.delegate = self
    assistant = MCAdvertiserAssistant(serviceType: serviceType, discoveryInfo: nil, session: session)
     assistant.start()
        
    }
    
    func browserViewControllerDidFinish(browserViewController: MCBrowserViewController) {
        browserViewController.dismissViewControllerAnimated(false, completion: nil)
    }
    
    func browserViewControllerWasCancelled(browserViewController: MCBrowserViewController) {
         browserViewController.dismissViewControllerAnimated(false, completion: nil)
    }

    // Remote peer changed state.
    func session(session: MCSession, peer peerID: MCPeerID, didChangeState state: MCSessionState) {
        
    }
    
    // Received data from remote peer.
    @available(iOS 7.0, *)
    func session(session: MCSession, didReceiveData data: NSData, fromPeer peerID: MCPeerID) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            if let msg = String(data: data, encoding: NSUTF8StringEncoding) {
                
                self.updateChat(msg, fromPeer:peerID)
            }
        }
    }
    func updateChat(text:String,fromPeer peerID:MCPeerID) {
        var name:String!
        switch peerID {
        case self.peerID:
            name = "me"
        default:
            name = peerID.displayName
            
        }
        
        let message = "\(name):\(text)\n"
        
        self.textView.text = self.textView.text + message
        
        
        
    }
   
    
    // Start receiving a resource from remote peer.
    
    func session(session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, withProgress progress: NSProgress) {
        
    }
    
    
    // Received a byte stream from remote peer.
    
    func session(session: MCSession, didReceiveStream stream: NSInputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
        
    }
    // Finished receiving a resource from remote peer and saved the content
    // in a temporary location - the app is responsible for moving the file
    // to a permanent location within its sandbox.
    
    func session(session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, atURL localURL: NSURL, withError error: NSError?) {
        
    }
    

}

