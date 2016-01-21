//
//  Movie.m
//  JKKTableViewInClass
//
//  Created by trainer on 1/20/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (instancetype)initWithTitle:(NSString *)title duration:(float)duration
{
    self = [super init];
    if (self) {
        _title = title;
        _duration = duration;
    }
    return self;
}


-(id)copyWithZone:(NSZone *)zone {
    
    id movie = [[[self class]  allocWithZone:zone]initWithTitle:_title duration:_duration];
    
    return  movie;
    
}
+(NSArray *)movies {
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    Movie *movie = [[Movie alloc] initWithTitle:@"美人鱼" duration:140];
    [arr addObject:movie];
    
  Movie *movie2 = [movie copy];
    movie2.title = @"超人前传";
    movie2.duration = 112;
    
    [arr addObject:movie2];
    
    Movie *movie3 = [movie copy];
    movie3.title = @"疯狂的石头";
    movie3.duration = 88;
    
    [arr addObject:movie3];
    return arr;
}


@end
