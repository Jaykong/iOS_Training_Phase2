//
//  ViewController.m
//  UsingSwift
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "ViewController.h"
#import "UsingSwift-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MyClass *myClass = [[MyClass alloc] init];
    [myClass greeting:@"hello"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
