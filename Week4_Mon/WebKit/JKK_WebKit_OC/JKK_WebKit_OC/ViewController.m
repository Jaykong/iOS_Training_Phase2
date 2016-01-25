//
//  ViewController.m
//  JKK_WebKit_OC
//
//  Created by kongyunpeng on 1/23/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
   // NSString *html = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    NSURL *url = [NSURL URLWithString:path];
    WKWebView *wkWebView = (WKWebView*)self.view;
    [wkWebView loadFileURL:url allowingReadAccessToURL:url];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
