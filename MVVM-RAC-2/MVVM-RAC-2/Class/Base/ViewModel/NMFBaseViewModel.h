//
//  NMFBaseViewModel.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMFViewModelServices.h"
#import "NMFViewModelNavigationImpl.h"

@interface NMFBaseViewModel : NSObject

@property (nonatomic, copy) NSString *title;

@property(nonatomic,strong,readonly)id<NMFViewModelServices> services;
@property(nonatomic,strong)NMFViewModelNavigationImpl *naviImpl;
@property (nonatomic, copy, readonly) NSDictionary *params;

/** 自定义初始化方法 */
- (instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params;



 /**
  判断是否登陆

  @param goGoLogin 如果没有登录，是否跳转登录页面
  @return 是否登陆
  */
- (BOOL)judgeWhetherLogin:(BOOL)goGoLogin;

@end
