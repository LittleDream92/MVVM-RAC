//
//  NMFMeTableViewCell.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMFMeTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *me_TitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *me_subTitle;

//重置
- (void)updataTitle:(NSString *)title subTitle:(NSString *)subTitle;

@end
