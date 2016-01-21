//
//  TableViewCell.m
//  CodeTableView-OC
//
//  Created by kongyunpeng on 1/19/16.
//  Copyright © 2016 kongyunpeng. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
     //   self.contentView.frame = [UIScreen mainScreen].bounds;
        CGRect rect = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.contentView.frame.size.height);
        _label = [[UILabel alloc] initWithFrame:rect];
        
        _label.backgroundColor = [UIColor blueColor];
        _label.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_label];
        
       
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
