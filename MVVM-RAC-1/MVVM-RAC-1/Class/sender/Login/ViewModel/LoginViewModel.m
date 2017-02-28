//
//  LoginViewModel.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/27.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

-(instancetype)init {
    self = [super init];
    
    if (self) {
        
        //监听手机号
        RACSignal *userSignal = [RACObserve(self, userName) map:^id(NSString *value) {
            //可以在这里利用正则表达式进行手机号筛选和验证
            if (value.length >= 11) {
                return @(YES);
            }
            return @(NO);
        }];
        
        //监听密码
        RACSignal *passwordSignal = [RACObserve(self, password) map:^id(NSString *value) {
            //可以在这里对密码进行字母数字等的验证筛选
            if (value.length >= 6) {
                return @(YES);
            }
            return @(NO);
        }];
        
        //合并signal，只有两者都符合要求了，才能启动登录按钮（但是有个问题——没有提示文字，如果记错密码，但是认为记得是正确的，输入完成后没有任何提示）
        RACSignal *combineSignal = [RACSignal combineLatest:@[userSignal, passwordSignal] reduce:^id(NSNumber *username, NSNumber *password){
            return @([username boolValue] && [password boolValue]);
        }];
        
        
        //登录操作
        _loginCommond = [[RACCommand alloc] initWithEnabled:combineSignal signalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    //在这里进行网络请求
                    
                    [subscriber sendNext:@"pop"];
                    [subscriber sendCompleted];
                });
                
                return nil;
            }];
        }];
        
        //注册操作
        _registCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [DCURLRouter pushURLString:RegViewControllerURL animated:YES];
                });
                
                [subscriber sendCompleted];
                return nil;
            }];
        }];
    }
    
    return self;
}

@end
