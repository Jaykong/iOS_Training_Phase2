//
//  LabelTextFieldCell.h
//  Feedback
//
//  Created by kongyunpeng on 11/29/15.
//  Copyright © 2015 kongyunpeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelTextFieldCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end
