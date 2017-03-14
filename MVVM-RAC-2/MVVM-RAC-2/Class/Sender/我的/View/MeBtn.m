//
//  MeBtn.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/14.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "MeBtn.h"

@interface MeBtn ()

@property (nonatomic, strong) UILabel *bageLabel;

@end



@implementation MeBtn

/**
 *  构建方法，最低高度65
 */
+ (instancetype)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName
{
    MeBtn *btn = [self buttonWithType:UIButtonTypeCustom];
    //设置title和image
    [btn configViewWithTitle:title image:imageName];
    return btn;
}


- (void)configViewWithTitle:(NSString *)title image:(NSString *)imageName
{
    UIImageView *imageView      = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.tag               = 111;
    [self addSubview:imageView];
    @weakify(self);
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(15);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(25);
    }];
    
    UILabel *label              = [[UILabel alloc]init];
    label.textAlignment         = NSTextAlignmentCenter;
    label.textColor             = NMFCOLOR(70, 70, 70, 1);
    label.font                  = [UIFont nmfNormalFont:15];
    label.text                  = title;
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        @strongify(self);
        make.top.equalTo(imageView.mas_bottom).offset(5);
        make.left.equalTo(self);
        make.right.equalTo(self);
        make.height.equalTo(@20);
    }];

}


#pragma mark - setter  and  getter
//一赋值，就调用 
-(void)setBageValue:(NSInteger)bageValue
{
    _bageValue = bageValue >= 99 ? 99 : bageValue;  //最大99
    if (bageValue == 0) {
        //隐藏
        [self.bageLabel removeFromSuperview];
        self.bageLabel.tag = 0;
    } else {
        if (self.bageLabel.tag == 0) {
            //重新初始化
            [self addSubview:self.bageLabel];
            [self bringSubviewToFront:self.bageLabel];
            self.bageLabel.tag = 1;
            UIView *view = [self viewWithTag:111];
            [self.bageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(view).offset(-8);
                make.right.equalTo(view).offset(8);
                make.width.mas_equalTo(16);
                make.height.mas_equalTo(16);
            }];
        }
        self.bageLabel.text = [NSString stringWithFormat:@"%ld", bageValue];
    }
}


-(UILabel *)bageLabel
{
    if (!_bageLabel) {
        
        _bageLabel = [[UILabel alloc] init];
        _bageLabel.textAlignment = NSTextAlignmentCenter;
        _bageLabel.textColor = [UIColor whiteColor];
        _bageLabel.font = [UIFont nmfNormalFont:10];
        _bageLabel.backgroundColor = [UIColor redColor];
        _bageLabel.layer.cornerRadius = 8;
        _bageLabel.layer.masksToBounds = YES;
        
    }
    return _bageLabel;
}

@end
