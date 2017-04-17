//
//  RequestManager.m
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "RequestManager.h"

@interface RequestManager ()

@end



@implementation RequestManager

//本地数据(array)
+ (RACSignal *)postArrayDataWithURL:(NSString *)urlString
                          parameter:(NSDictionary *)param {
    
#warning 以后根据项目修改time
    CGFloat time = arc4random() %15 / 10.0;
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlString ofType:nil]];
    
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:array];
        [subscriber sendCompleted];
        return nil;
    }] delay:time];
    
}

//本地数据(Dic)
+ (RACSignal *)postDicDataWithURL:(NSString *)urlString
                        parameter:(NSDictionary *)param {
#warning 以后根据项目修改time
    CGFloat time = arc4random() %15 / 10.0;
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:urlString ofType:nil]];
    
    return [[RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:dic];
        [subscriber sendCompleted];
        return nil;
    }] delay:time];
}

//网络请求
+ (RACSignal *)getWithURL:(NSString *)urlString
                parameter:(NSDictionary *)param {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //超时时间 5S
    manager.requestSerializer.timeoutInterval = 5;
    RACSubject *sub = [RACSubject subject];
    
    [manager GET:urlString parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [sub sendNext:@{@"code":@100, @"data":responseObject}];
        [sub sendCompleted];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [sub sendNext:@{@"code":@-400, @"data":@"请求失败"}];
        [sub sendCompleted];
        
    }];
    
    return sub;
}

+ (RACSignal *)postWithURL:(NSString *)urlString
                 parameter:(NSDictionary *)param {
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //超时时间 5S
    manager.requestSerializer.timeoutInterval = 5;
    
    RACSubject *sub = [RACSubject subject];
    
    [manager POST:urlString parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [sub sendNext:@{@"code":@100, @"data":responseObject}];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [sub sendNext:@{@"code":@-400, @"data":@"请求失败"}];
        [sub sendCompleted];
        
    }];
    
    return sub;
}

@end
