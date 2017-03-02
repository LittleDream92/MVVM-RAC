//
//  NMFNavigationController.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFNavigationController.h"

@interface NMFNavigationController () <UINavigationControllerDelegate>

@end

@implementation NMFNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetNavi];
    
    self.delegate = self;
    
    //设置导航栏字体（全局）
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
}

/** 导航栏 */
- (void)resetNavi {
    
}

#pragma mark - UINavigationControllerDelegate

//push页面时隐藏tabbar栏
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
