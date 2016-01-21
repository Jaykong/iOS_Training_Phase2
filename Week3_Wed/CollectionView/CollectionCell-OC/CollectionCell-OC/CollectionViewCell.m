//
//  CollectionViewCell.m
//  CollectionCell-OC
//
//  Created by kongyunpeng on 1/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

#import "CollectionViewCell.h"

@implementation CollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor greenColor];
        _label = [[UILabel alloc] initWithFrame:self.contentView.frame];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor whiteColor];
       
        [self.contentView addSubview:_label];
        
    }
    return self;
}

@end
