//
//  ViewController.h
//  JKKEvent_OC
//
//  Created by trainer on 1/21/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
@interface ViewController : UIViewController

@property (nonatomic, strong) EKEventStore *eventStore;
@end

