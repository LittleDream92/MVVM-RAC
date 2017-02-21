//
//  BaseViewController.m
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSubViews];
    [self bindViewModel];
    [self layoutNavigation];
    [self getNewData];
}


#pragma mark - RAC
/**
 *  添加控件
 */
- (void)addSubViews {}


/**
 *  绑定
 */
- (void)bindViewModel {}


/**
 *  设置navigation
 */
- (void)layoutNavigation {}


/**
 *  初次获取数据
 */
- (void)getNewData {}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
