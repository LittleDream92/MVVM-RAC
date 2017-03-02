//
//  RootViewController.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RootViewController.h"
#import "NMFNavigationController.h"
#import "NMFHomeViewController.h"
#import "NMFCategoryViewController.h"
#import "NMFFoundViewController.h"
#import "NMFShoppingCartViewController.h"
#import "NMFMeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 加载子控制器
- (void)addChildVC {
    
    NMFHomeViewController *homeVC = [[NMFHomeViewController alloc] initWithViewModel:[[NMFHomeViewModel alloc] initWithService:nil params:@{@"title": @"首页"}]];
    NMFNavigationController *nav1 = [self setChildVC:homeVC title:@"首页" imageName:@"homeNormal" withSelectedName:@"homeHight"];
    
    NMFCategoryViewController *categoryVC = [[NMFCategoryViewController alloc] initWithViewModel:[[NMFCategoryViewModel alloc] initWithService:nil params:@{@"title":@"分类"}]];
    NMFNavigationController *nav2 = [self setChildVC:categoryVC title:@"分类" imageName:@"categoryNormal" withSelectedName:@"categoryHight"];
    
    NMFFoundViewController *foundVC = [[NMFFoundViewController alloc] initWithViewModel:[[NMFFoundViewModel alloc] initWithService:nil params:@{@"title": @"发现"}]];
    NMFNavigationController *nav3 = [self setChildVC:foundVC title:@"发现" imageName:@"foundNormal" withSelectedName:@"foundHight"];
    
    NMFShoppingCartViewController *shoppingVC = [[NMFShoppingCartViewController alloc] initWithViewModel:[[NMFShoppingCartViewModel alloc] initWithService:nil params:@{@"title":@"购物车"}]];
    NMFNavigationController *nav4 = [self setChildVC:shoppingVC title:@"购物车" imageName:@"carNormal" withSelectedName:@"carHight"];
    
    NMFMeViewController *meVC = [[NMFMeViewController alloc] initWithViewModel:[[NMFMeViewModel alloc] initWithService:nil params:@{@"title": @"我的"}]];
    NMFNavigationController *nav5 = [self setChildVC:meVC title:@"我的" imageName:@"meNoraml" withSelectedName:@"meHight"];
    
    self.viewControllers = @[nav1, nav2, nav3, nav4, nav5];
}

- (NMFNavigationController *)setChildVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imgName withSelectedName:(NSString *)selectedName {
    
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imgName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedName];
    
    //设置标签栏按钮不为蓝色
    self.tabBar.tintColor = THEME_COLOR;

    
    //设置标签栏字体颜色
    NSDictionary *dic = @{NSForegroundColorAttributeName: BLACK_COLOR, NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:dic forState:UIControlStateNormal];
    
    NSDictionary *selectDic = @{NSForegroundColorAttributeName:THEME_COLOR,NSFontAttributeName:[UIFont systemFontOfSize:12]};
    [vc.tabBarItem setTitleTextAttributes:selectDic forState:UIControlStateSelected];
    
    
    NMFNavigationController *nav = [[NMFNavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}





@end
