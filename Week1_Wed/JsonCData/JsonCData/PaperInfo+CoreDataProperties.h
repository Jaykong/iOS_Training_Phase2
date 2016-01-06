//
//  PaperInfo+CoreDataProperties.h
//  JsonCData
//
//  Created by trainer on 1/6/16.
//  Copyright © 2016 trainer. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PaperInfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaperInfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *title;
@property (nullable, nonatomic, retain) NSString *paperID;
@property (nullable, nonatomic, retain) NSString *paperType;

@end

NS_ASSUME_NONNULL_END
