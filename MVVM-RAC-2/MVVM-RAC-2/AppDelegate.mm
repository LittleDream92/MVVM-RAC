//
//  AppDelegate.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//


//本文仿写地址：https://github.com/wangtongke/WTKMVVMRAC

#import "AppDelegate.h"
#import "RootViewController.h"
//定位的单例
#import "MapManager.h"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置键盘  单例
    IQKeyboardManager *manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.enableAutoToolbar = NO;
    
    //设置HUD的样式是黑色的
    [SVProgressHUD setDefaultStyle:SVProgressHUDStyleDark];
    
    //test 读取数据
    [DataManager readUserData];
    
    //test 检测网络是否可用
    [[NetWork shareInstance] initNetWork];
    if ([NetWork shareInstance].isNetReachable) {
        NSLog(@"yes network");
    } else {
        NSLog(@"no network");
    }
    
    //test 定位
    
    BMKMapManager *mapManager = [[BMKMapManager alloc] init];
    if ([mapManager start:@"MoboTBCXuQbImL0wfRSCtyHAjk9j6prp" generalDelegate:nil]) {
        NSLog(@"百度地图startSuccess");
        //开始定位
        [[MapManager manager] startUserLocation];
    }
    
    
    [self setupRootViewController];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - rootController
- (void)setupRootViewController {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    RootViewController *rootVC = [[RootViewController alloc] init];
    self.window.rootViewController = rootVC;
    
}


@end
