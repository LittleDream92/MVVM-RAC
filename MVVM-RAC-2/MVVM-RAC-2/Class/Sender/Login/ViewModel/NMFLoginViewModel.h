//
//  NMFLoginViewModel.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFBaseViewModel.h"

@interface NMFLoginViewModel : NMFBaseViewModel

//手机号
@property (nonatomic, strong) NSString *phoneNum;

//验证码
@property (nonatomic, strong) NSString *codeNum;


@property (nonatomic, strong) RACSignal *phoneSignal;
//是否可以登录的信号
@property (nonatomic, strong) RACSignal *canLoginSignal;
//是否可以点击发送验证码的信号
@property (nonatomic, strong) RACSignal *canCodeSignal;


//发送验证码的操作
@property (nonatomic, strong) RACCommand *codeCommand;
//登录的操作
@property (nonatomic, strong) RACCommand *loginCommand;

@end
