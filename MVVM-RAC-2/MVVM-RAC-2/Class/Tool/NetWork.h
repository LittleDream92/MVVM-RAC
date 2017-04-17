//
//  NetWork.h
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//
//这个类是验证网络是否可用的，不是网络请求的类

#import <Foundation/Foundation.h>

@interface NetWork : NSObject

//网络是否可用
@property (nonatomic, assign) BOOL isNetReachable;

//单例
+ (instancetype)shareInstance;

- (void)initNetWork;

@end
