//
//  TrackViewController.m
//  ShowCaseJK
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "TrackViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface TrackViewController () <CLLocationManagerDelegate>
{
    UISwitch *trackSwitch;
    UILabel *locationLbl;
    CLLocationManager *manager;
}
@end

@implementation TrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    trackSwitch = [[UISwitch alloc] init];
    [self.view addSubview:trackSwitch];
    
    locationLbl = [[UILabel alloc] init ];
    locationLbl.numberOfLines = 0;
    locationLbl.backgroundColor = [UIColor lightGrayColor];
    locationLbl.textColor = [UIColor whiteColor];
    
    [self.view addSubview:locationLbl];
    
    
    trackSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    locationLbl.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:trackSwitch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0];
    // trackSwitch > CenterX(100 * 1 + 0,100)
    // self.view CenterX(100,0)
    
    
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:trackSwitch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1 constant:100];
    
    [self.view addConstraints:@[centerYConstraint,centerXConstraint]];
    
    
    NSLayoutConstraint *leftConstraintLbl = [NSLayoutConstraint constraintWithItem:locationLbl attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    NSLayoutConstraint *rightConstraintLbl = [NSLayoutConstraint constraintWithItem:locationLbl attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
   
    NSLayoutConstraint *topConstraintLbl = [NSLayoutConstraint constraintWithItem:locationLbl attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:20];
    NSLayoutConstraint *bottomConstraintLbl = [NSLayoutConstraint constraintWithItem:locationLbl attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:trackSwitch attribute:NSLayoutAttributeBottom multiplier:1 constant:-60];
    
    //NSLayoutConstrain  t *heightContraintLbl = [NSLayoutConstraint constraintWithItem:locationLbl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:60];
    
    [self.view addConstraints:@[leftConstraintLbl,rightConstraintLbl,topConstraintLbl,bottomConstraintLbl]];
    
    [trackSwitch addTarget:self action:@selector(changeToggle:) forControlEvents:UIControlEventValueChanged];
    //CLLocationManager *manager = [CLLocationManager def]
  
    
    
    
}
- (void)changeToggle:(UISwitch *)trSwitch {
    
    if (trSwitch.on) {
        if (![CLLocationManager locationServicesEnabled]) {
            
            trackSwitch.on = NO;
        }
        
        if (manager == nil) {
            manager = [[CLLocationManager alloc] init];
        
            manager.delegate = self;
            manager.distanceFilter = 10.0;
            manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            [manager requestWhenInUseAuthorization];
            
        }
        [manager startUpdatingLocation];
    } else {
        if (manager != nil) {
            [manager stopUpdatingLocation];
        }
    }
   
        
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - LocationManager: Delegate
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *location = locations[locations.count - 1];
    locationLbl.text = location.description;
    
}
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"%@",error.description);
}
@end
