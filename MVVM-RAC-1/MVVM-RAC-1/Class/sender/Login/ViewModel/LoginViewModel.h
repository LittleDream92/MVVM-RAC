//
//  LoginViewModel.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/27.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginViewModel : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *password;

@property (nonatomic, strong, readonly) RACCommand *loginCommond;
@property (nonatomic, strong, readonly) RACCommand *registCommond;

@end
