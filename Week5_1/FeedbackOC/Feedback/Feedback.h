//
//  Feedback.h
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol
FeedbackPostDidSuccess;
@interface Feedback : NSObject
-(void)postFeedback:(int)tel qq:(int)qq email:(NSString *)email
            content:(NSString *)content;
@property (nonatomic,strong) NSString *receivedStr;
@property (nonatomic,weak) id<FeedbackPostDidSuccess> delegate;
@end

@protocol FeedbackPostDidSuccess
-(void)dismissActivityIndicator;

@end