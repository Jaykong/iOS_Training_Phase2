//
//  ViewController.m
//  JKKWebView_JS_OC
//
//  Created by kongyunpeng on 1/23/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

-(void)loadRemoteWeb{
    NSURL *url = [NSURL URLWithString:@"http://chrisrisner.com/31-Days-of-iOS--Day-14-The-UIWebView/"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    _webView.scalesPageToFit = YES;
    [_webView loadRequest:request];
}


-(void)loadLocalHtml{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"LocalHtml" ofType:@"html"];
    NSString *contents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    [_webView loadHTMLString:contents baseURL:[NSURL URLWithString:filePath]];
   
}

-(void)loadHtmlWithJS {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"LocalHtml" ofType:@"html"];
    NSString *contents = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
   
    NSString *jsString = [NSString stringWithFormat:
                          @"<script>alert(\"This is a Java Script Alert\");</script>"];
    NSString *finalContents = [NSString stringWithFormat:@"%@%@",contents,jsString];
    [_webView loadHTMLString:finalContents baseURL:[NSURL URLWithString:filePath]];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self loadHtmlWithJS];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
