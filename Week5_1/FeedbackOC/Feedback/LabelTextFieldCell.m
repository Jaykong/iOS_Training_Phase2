//
//  LabelTextFieldCell.m
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import "LabelTextFieldCell.h"

@implementation LabelTextFieldCell
-(void)awakeFromNib{
    static int i = 0;
    _textField.backgroundColor = [UIColor lightGrayColor];
    _textField.tag = ++i;
    
}
@end
