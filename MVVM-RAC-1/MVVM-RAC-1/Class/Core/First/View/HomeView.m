//
//  HomeView.m
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeView.h"


@interface HomeView ()

//控件
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *headImage;
@property (nonatomic, strong) UIButton *changeImageButton;
@property (nonatomic, strong) UIButton *pushvcButton;

@end




@implementation HomeView

-(void)addChildView {
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.text = @"你好我是音乐君";
    [self addSubview:self.titleLabel];
    
    self.headImage = [[UIImageView alloc] init];
    self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
    [self addSubview:self.headImage];
    
    self.changeImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.changeImageButton setTitle:@"点击改变头像" forState:UIControlStateNormal];
    [self.changeImageButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.changeImageButton setBackgroundColor:[UIColor colorWithHexString:@"3182D9"]];
    [self addSubview:self.changeImageButton];
    
    self.pushvcButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.pushvcButton setTitle:@"Aspects－AOP" forState:UIControlStateNormal];
    [self.pushvcButton setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    [self.pushvcButton setBackgroundColor:[UIColor colorWithHexString:@"C93F45"]];
    [self addSubview:self.pushvcButton];
    
}

//布局
-(void)updateConstraints {
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    
    self.titleLabel.sd_layout.topSpaceToView(self, 30).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    
    self.headImage.sd_layout.topSpaceToView(self, 64).heightIs(150).widthIs(200).centerXEqualToView(self);
    
    self.changeImageButton.sd_layout.leftSpaceToView(self, 10).topSpaceToView(self, 230).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
    
    self.pushvcButton.sd_layout.leftSpaceToView(self.changeImageButton, 0).topSpaceToView(self, 230).widthIs(SCREEN_WIDTH/2 - 10).heightIs(50);
    
    [super updateConstraints];
}


#pragma mark -
- (void)changeImage {
    NSLog(@"changeImage");
}

- (void)pushAopVC {
    NSLog(@"pushAopVC");
}



@end
