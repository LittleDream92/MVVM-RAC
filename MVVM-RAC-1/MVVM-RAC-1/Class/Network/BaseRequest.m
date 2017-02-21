//
//  BaseRequest.m
//  nmf
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseRequest.h"
#import "AFNetworking.h"
#import "MBProgressHUD+Add.h"

#define baseURL @"https://www.baidu.com"

@implementation BaseRequest

-(instancetype)init {
    return [self initWithToken];
}

/** 添加构造方法 */
- (instancetype)initWithToken {
    NSURL *url = [NSURL URLWithString:baseURL];
    if (self = [super initWithBaseURL:url]) {
        NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
        [self produceHTTPSign:str];
    }
    return self;
}

/**
 *  生成一个API访问签名
 */
- (void)produceHTTPSign:(NSString *)token {
    //根据需求设置
    
}


- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            success:(void(^)(id responseData))success
            failure:(void(^)(NSError *error))failure
        showLoading:(BOOL)showLoading
        showMessage:(NSString *)showMessage {
    
    [self postRequest:url
               params:paramDic
              success:^(id responseData) {
                  if (success) {
                      success(responseData);
                  }
              } responseFailure:^{
                  
              } failure:^(NSError *error) {
                  if (failure) {
                      failure(error);
                  }
              } showLoading:showLoading
          showMessage:showMessage];
    
}

- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            success:(void(^)(id responseData))success
    responseFailure:(void(^)())responseFailure
            failure:(void(^)(NSError *error))failure
        showLoading:(BOOL)showLoading
        showMessage:(NSString *)showMessage {
    
   //1、检测网络
    
    if (showLoading && (showMessage == nil || [showMessage isEqualToString:@""])) {
        showMessage = @"加载中";
    }
    
    if (showLoading) {
        //添加提示
        [MBProgressHUD showMessag:showMessage toView:nil];
    }
    
    //2、网络请求
    [self POST:url parameters:paramDic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"~~~%@", responseObject);
        
        //隐藏提示
        [MBProgressHUD hideHUDForView:nil animated:YES];
        if ([responseObject[@"IsSuccess"] integerValue] == 1) {
            if (success) {
                success(responseObject[@"data"]);
            }
        }else {
            NSLog(@"啊偶，不是想要的数据");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}


@end
