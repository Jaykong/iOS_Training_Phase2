//
//  ViewController.m
//  JKKEvent_OC
//
//  Created by trainer on 1/21/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSDate *date;
@property (nonatomic,getter=cal,copy) NSArray *calendars;
@property (nonatomic,getter=eve,copy) NSArray *events;
@end

@implementation ViewController

-(NSArray *)cal {
    return [_eventStore calendarsForEntityType:EKEntityTypeEvent];
}

-(NSArray *)eve {
    NSDate *endDate = [_date dateByAddingTimeInterval:24 * 60 * 60];
    NSPredicate *predicate = [self.eventStore predicateForEventsWithStartDate:_date endDate:endDate calendars:self.cal];
    return  [self.eventStore eventsMatchingPredicate:predicate];
    
}

-(EKEventStore *)eventStore {
    
    if (_eventStore == nil) {
        _eventStore = [[EKEventStore alloc] init];
    }
    return _eventStore;
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError * _Nullable error) {
        if (!granted) {
            NSLog(@"%@",error.description);
        }
   }];
    
    _date = [NSDate date];
    [self.date addObserver:self forKeyPath:@"date" options:NSKeyValueObservingOptionNew context:nil];
    
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
   NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay|NSCalendarUnitMonth|NSCalendarUnitYear fromDate:[NSDate date]];
   NSDate *date = [[NSCalendar currentCalendar] dateFromComponents:components];
    _date = date;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
