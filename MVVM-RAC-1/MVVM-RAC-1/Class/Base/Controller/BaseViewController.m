//
//  BaseViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/22.
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - protocol
-(void)addSubViews {}

-(void)bindViewModel {}

-(void)layoutNavigation {}

-(void)getNewData {}

@end
