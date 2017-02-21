//
//  HomeTableViewCell.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RootTableViewCell.h"

@interface HomeTableViewCell : RootTableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

//自适应高度
- (void)cellAutoLayoutHeight:(NSString *)title;

@end
