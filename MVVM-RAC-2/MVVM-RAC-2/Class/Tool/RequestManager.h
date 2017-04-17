//
//  RequestManager.h
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestManager : NSObject

//本地数据(array)
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                          parameter:(NSDictionary *)param;

//本地数据(Dic)
+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                        parameter:(NSDictionary *)param;

//get 网络请求
+ (RACSignal *)getWithURL:(NSString *)urlString
                parameter:(NSDictionary *)param;

//post 网络请求
+ (RACSignal *)postWithURL:(NSString *)urlString
                 parameter:(NSDictionary *)param;

@end
