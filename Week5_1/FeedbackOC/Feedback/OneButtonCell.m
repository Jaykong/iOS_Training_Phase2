//
//  OneButtonCell.m
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "OneButtonCell.h"

@implementation OneButtonCell

-(void)awakeFromNib{
    _aButton.backgroundColor = [UIColor lightGrayColor];
    [_aButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}
@end
