//
//  HomeTableViewCell.h
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface HomeTableViewCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

//重新配置titleLabel的高度
- (void)cellAutoLayoutHeight:(NSString *)title;

@end
