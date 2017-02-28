//
//  HomeView.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/22.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeView.h"

@interface HomeView ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIButton *changeImageButton;
@property (nonatomic, strong) UIButton *pushAopVCButton;

@end


@implementation HomeView


#pragma mark - UI
/** 添加子视图 */
-(void)addChildView {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.text = @"你好，我是音乐君";
    [self addSubview:self.titleLabel];
    
    self.headImage = [[UIImageView alloc] init];
    self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
    [self addSubview:self.headImage];
    
    self.changeImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.changeImageButton setTitle:@"更换头像" forState:UIControlStateNormal];
    [self.changeImageButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.changeImageButton setBackgroundColor: [UIColor colorWithHexString:@"3182D9"]];

    [self addSubview:self.changeImageButton];
    
    self.pushAopVCButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushAopVCButton setTitle:@"push" forState:UIControlStateNormal];
    [self.pushAopVCButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.pushAopVCButton setBackgroundColor:[UIColor colorWithHexString:@"C93F45"]];
    [self addSubview:self.pushAopVCButton];
    
    [self changeImage];
    [self pushAopVC];

    [self updateConstraints];
}

/** 设置frame */
-(void)updateConstraints {
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    
    self.titleLabel.sd_layout.topSpaceToView(self,30).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    
    self.headImage.sd_layout.topSpaceToView(self, 64).widthIs(200).heightIs(150).centerXEqualToView(self);
    
    self.changeImageButton.sd_layout.leftSpaceToView(self, 10).topSpaceToView(self, 230).heightIs(50).widthIs((SCREEN_WIDTH-20)/2);
    
    self.pushAopVCButton.sd_layout.leftSpaceToView(self.changeImageButton, 0).topEqualToView(self.changeImageButton).heightIs(50).widthIs((SCREEN_WIDTH-20)/2);
    
    [super updateConstraints];
}

#pragma mark - action
/** 更换头像的操作 */
- (void)changeImage {
    
    [[self.changeImageButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        static int i = 0;
        i++;
        if (i%2 == 0) {
            self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
        } else {
            self.headImage.image = [UIImage imageNamed:@"music.jpg"];
        }
    }];
}

/** 自定义URL push到控制器的操作 */
- (void)pushAopVC {
    
    [[self.pushAopVCButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        //跳转
        [DCURLRouter pushURLString:AOPViewControllerURL animated:YES];
    }];
    
}

@end
