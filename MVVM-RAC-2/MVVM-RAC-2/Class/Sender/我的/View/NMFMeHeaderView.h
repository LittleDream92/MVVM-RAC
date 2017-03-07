//
//  NMFMeHeaderView.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/6.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NMFMeHeaderView : UIView


@property (nonatomic, strong) UIImageView *n_headimageView;
@property (nonatomic, strong) UILabel *n_nickNameLabel;
@property (nonatomic, strong) UILabel *n_phoneNum;

@property (nonatomic, strong) UIImageView *n_noLoginHead;

/** 刷新，根据是否登陆 */
- (void)upDate;

@end
