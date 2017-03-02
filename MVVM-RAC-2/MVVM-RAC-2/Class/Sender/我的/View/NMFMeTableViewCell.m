//
//  NMFMeTableViewCell.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFMeTableViewCell.h"

@implementation NMFMeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - 
- (void)updataTitle:(NSString *)title subTitle:(NSString *)subTitle {
    
    self.me_TitleLabel.text = title;
    
    if (subTitle.length > 0) {
        
        self.me_subTitle.hidden = NO;
        self.me_subTitle.text = subTitle;
        
    } else {
        self.me_subTitle.hidden = YES;
    }
    
}

@end
