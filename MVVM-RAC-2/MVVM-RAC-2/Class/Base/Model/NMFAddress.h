//
//  NMFAddress.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMFAddress : NSObject <NSCoding>

//名字
@property (nonatomic, copy) NSString *n_name;

//地址
@property (nonatomic, copy) NSString *n_address;

//手机号
@property (nonatomic, copy) NSString *n_phone;

//性别    yes－男   no－女
@property (nonatomic, assign) BOOL n_sex;

//详细地址
@property (nonatomic, copy) NSString *n_detailAddress;

@end
