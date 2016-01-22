//
//  AppDelegate.swift
//  JKKLocalNotification_Swift
//
//  Created by trainer on 1/22/16.
//  Copyright © 2016 trainer. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        let settings = UIUserNotificationSettings(forTypes: [.Alert,.Sound], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        
        let locoalNotification = UILocalNotification()
        locoalNotification.alertBody = "Allien send a message to you"
        locoalNotification.fireDate = NSDate(timeInterval: 1, sinceDate: NSDate())
        
        UIApplication.sharedApplication().scheduleLocalNotification(locoalNotification)
        
        
        return true
    }
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        print(notification.alertBody)
        
        let controller = UIAlertController(title: nil, message: notification.alertBody, preferredStyle: .Alert)
        
        let action1 = UIAlertAction(title: "ok", style:.Default , handler: nil)
        controller.addAction(action1)
        
        let action2 = UIAlertAction(title: "cancel", style:.Destructive , handler: {(action)->Void in print("cancel")})
        controller.addAction(action2)
        
        self.window?.rootViewController?.presentViewController(controller, animated: false, completion: nil)
    }
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

