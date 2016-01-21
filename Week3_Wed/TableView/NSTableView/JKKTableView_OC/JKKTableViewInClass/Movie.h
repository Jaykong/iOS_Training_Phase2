//
//  Movie.h
//  JKKTableViewInClass
//
//  Created by trainer on 1/20/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject<NSCopying>
@property (nonatomic,copy) NSString *title;
@property (nonatomic, assign) float duration;

+(NSArray *)movies;
@end
