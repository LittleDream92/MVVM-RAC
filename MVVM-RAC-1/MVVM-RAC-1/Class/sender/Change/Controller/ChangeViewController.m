//
//  ChangeViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/28.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "ChangeViewController.h"

@interface ChangeViewController ()

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark -
/** 添加子视图 */
-(void)addSubViews {
    
}

#pragma mark - 
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Change";
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
