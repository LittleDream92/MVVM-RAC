//
//  NMFMeHeaderView.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/6.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFMeHeaderView.h"

@implementation NMFMeHeaderView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    return self;
}

//初始化控件，masonry布局
- (void)setupViews {
    @weakify(self);
    
    //背景图片
    UIImageView *bgImg = [[UIImageView alloc] init];
    bgImg.image = [UIImage imageNamed:@"w_beijing"];
    [self addSubview:bgImg];
    //masonry必须添加进去之后才能写布局
    [bgImg mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.left.right.bottom.equalTo(self);
    }];
    
    //头像(登陆之后的)
    self.n_headimageView = [[UIImageView alloc] init];
    self.n_headimageView.image = [UIImage imageNamed:@"w_defaultHeader"];
    //圆角
    self.n_headimageView.layer.cornerRadius = 75 / 2.0;
    self.n_headimageView.layer.masksToBounds = YES;
    [self addSubview:self.n_headimageView];
    self.n_headimageView.hidden = YES;
    [self.n_headimageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(self).offset(64);
        make.left.equalTo(self).offset(25);
        make.width.height.mas_equalTo(75);
    }];
    
    //头像(未登陆的)
    self.n_noLoginHead = [[UIImageView alloc] init];
    self.n_noLoginHead.image = [UIImage imageNamed:@"w_noLogin"];
    [self addSubview:self.n_noLoginHead];
    [self.n_noLoginHead mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self);
        make.centerY.equalTo(self.n_headimageView);
        make.size.equalTo(self.n_headimageView);
    }];
    
    //昵称
    
}

#pragma mark -
/** 刷新，根据是否登陆 */
- (void)upDate {
    
    NSLog(@"这里判断是否已登陆");
    
}


@end
