//
//  RACWithKVOView.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RACWithKVOView.h"

@interface RACWithKVOView ()

@end

@implementation RACWithKVOView

#pragma mark - UI
-(void)addChildView {
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.topView.backgroundColor = [UIColor blueColor];
    [self addSubview:self.topView];
    
    self.clickButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.clickButton.frame = CGRectMake(0, 0, 100, 100);
    [self.clickButton setTitle:@"点击" forState:UIControlStateNormal];
    [self.clickButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.clickButton addTarget:self action:@selector(changeViewBackGrounColor) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.clickButton];
}


#pragma mark - frame


#pragma mark - action
- (void)changeViewBackGrounColor {
    static int i = 0;
    i++;
    
    if (i%2 == 0) {
        
        self.topView.backgroundColor = [UIColor blueColor];
        
    } else {
        
        self.topView.backgroundColor = [UIColor yellowColor];
        
    }
}


@end
