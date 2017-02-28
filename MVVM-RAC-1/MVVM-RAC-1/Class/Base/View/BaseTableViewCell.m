//
//  BaseTableViewCell.m
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addChildView];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self addChildView];
}

- (void)addChildView {
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
