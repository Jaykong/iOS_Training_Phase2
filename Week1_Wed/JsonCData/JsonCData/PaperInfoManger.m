//
//  PaperInfoManger.m
//  JsonCData
//
//  Created by trainer on 1/6/16.
//  Copyright © 2016 trainer. All rights reserved.
//

#import "PaperInfoManger.h"
#import "PaperInfo.h"
#import "AppDelegate.h"
@implementation PaperInfoManger

+(void)insertIntoPaperInfo:(NSDictionary *)dataDic {
    AppDelegate *appDelegate =  [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    PaperInfo *paperInfo = [NSEntityDescription insertNewObjectForEntityForName:@"PaperInfo" inManagedObjectContext:context];
    paperInfo.title = [dataDic valueForKey:@"title"];
    paperInfo.paperID = [dataDic valueForKey:@"paperID"];
    paperInfo.paperType = [dataDic valueForKey:@"paperType"];
    
    [appDelegate saveContext];
}
+(void)insertAllPapers:(NSArray *)dataArr {
    for (NSDictionary *dic in dataArr) {
        [PaperInfoManger insertIntoPaperInfo:dic];
    }
}

+(NSArray *)findAllPapers {
    AppDelegate *appDelegate =  [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"PaperInfo"];
    
    
   NSArray *papers = [context executeFetchRequest:request error:nil];
    
    return papers;
}



@end
