//
//  ViewController.m
//  UsingSwiftInOC
//
//  Created by trainer on 1/4/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "ViewController.h"
#import "UsingSwiftInOC-Swift.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Fraction *frac = [[Fraction alloc] initWithNumerator:1 denominator:2];
    NSLog(@"%ld/%ld",frac.numerator,frac.denominator);
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
