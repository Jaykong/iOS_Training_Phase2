//
//  Feedback.m
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "Feedback.h"
#import "ProgressHUD.h"
@implementation Feedback
-(void)postFeedback:(int)tel qq:(int)qq email:(NSString *)email content:(NSString *)content{
    //f[KVNProgress show];
    [ProgressHUD show:@"loading"];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:@"http://112.124.122.38/acountingExam/feedback.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
    NSString *para = [NSString stringWithFormat:@"qq=%i&tel=%i&email=%@&content=%@",qq,tel,email,content];
    
    request.HTTPMethod = @"POST";
    request.HTTPBody = [para dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        _receivedStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//        [KVNProgress dismiss];
//        [_delegate dismissActivityIndicator];
        [ProgressHUD dismiss];
        
    }];
    
    [task resume];
}
@end
