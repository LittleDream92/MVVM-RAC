//
//  NMFBaseViewModel.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFBaseViewModel.h"
#import "NMFLoginViewModel.h"

@interface NMFBaseViewModel ()

@property (nonatomic, strong, readwrite) id<NMFViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@end



@implementation NMFBaseViewModel

/** 自定义初始化方法 */
- (instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params {
    
    self = [super init];
    if (self) {
        self.title = params[@"title"];
        self.services = service;
        self.params = params;
    }
    return self;
}


/**
 判断是否登陆
 
 @param goGoLogin 如果没有登录，是否跳转登录页面
 @return 是否登陆
 */
- (BOOL)judgeWhetherLogin:(BOOL)goGoLogin {
    if ([NMFUser currentUser].isLogin) {
        return YES;
    }
    
    if (goGoLogin) {
        
        NSLog(@"去登陆");
        //push进去登录VC
        NMFLoginViewModel *viewModel = [[NMFLoginViewModel alloc] initWithService:self.services params:@{@"title":@"登陆"}];
        
        
    }
    
    return NO;
}

@end
