//
//  NetWork.m
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NetWork.h"
//Reachability类实际上是苹果公司对SCNetworkReachability API的封装，这个API定义在SystemConfigure.framework库中。如果有其他特别的需求，也可以直接使用这个原生的SCNetworkReachability类。
#import "Reachability.h"

@interface NetWork ()

@property (nonatomic, strong) Reachability *hostReach;

@property (nonatomic, strong) Reachability *internetReachability;

@end



@implementation NetWork

#pragma mark - 
//单例
+ (instancetype)shareInstance {
    
    static NetWork *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[NetWork alloc] init];
    });
    
    return manager;
}

- (void)initNetWork {
    //检测网络状态，如果发生改变，调用  reachabilityChanged  方法
    //异步
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    
    self.hostReach = [Reachability reachabilityWithAddress:@"https://www.baidu.com"];
    [self.hostReach startNotifier];
    [self updateInterfaceWithReachability:self.hostReach];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
    
}

#pragma mark - action
- (void)reachabilityChanged:(NSNotification *)note {
    Reachability *cuReach = [note object];
    NSParameterAssert([cuReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:cuReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    
    self.isNetReachable = NO;
    
    if (reachability == self.hostReach) {
        
        BOOL connectionRequired = [reachability connectionRequired];
        if (connectionRequired) {
            
            self.isNetReachable = YES;
            
        } else {
            
            self.isNetReachable = NO;
            [self noNet];
            
        }
        
    } else {
        
        NetworkStatus netStatus = [reachability currentReachabilityStatus];
        if (netStatus) {
            
            self.isNetReachable = YES;
            
        } else {
            
            self.isNetReachable = NO;
            [self noNet];
            
        }
        
    }
}


#pragma mark - 
-(BOOL)isNetReachable {
    [self initNetWork];
    return _isNetReachable;
}

- (void)noNet {
    //没有网络、网络不可用
    [SVProgressHUD showImage:[UIImage imageNamed:@"w_nonet"] status:@"网络不好"];
    DISMISS_SVP(1.2);
}

@end
