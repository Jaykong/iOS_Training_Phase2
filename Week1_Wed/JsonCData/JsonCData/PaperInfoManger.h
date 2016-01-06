//
//  PaperInfoManger.h
//  JsonCData
//
//  Created by trainer on 1/6/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaperInfoManger : NSObject
+(NSArray *)findAllPapers;
+(void)insertAllPapers:(NSArray *)dataArr;
@end
