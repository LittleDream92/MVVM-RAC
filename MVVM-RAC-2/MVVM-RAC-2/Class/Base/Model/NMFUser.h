//
//  NMFUser.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMFAddress.h"

@interface NMFUser : NSObject<NSCoding>

//头像
@property (nonatomic, strong) UIImage *headImage;

//昵称
@property (nonatomic, copy) NSString *nickName;

//名字
@property (nonatomic, copy) NSString *userName;

//性别    YES－男   NO－女
@property (nonatomic, assign) BOOL sex;

//生日
@property (nonatomic, copy) NSString *birthDay;

//是否开启指纹验证
@property (nonatomic, assign) BOOL isTouchID;

//角标
@property (nonatomic, assign) NSInteger bageValue;

//
@property (nonatomic, copy) NSString *bid;

//是否登陆
@property (nonatomic, assign) BOOL isLogin;

//手机号
@property (nonatomic, copy) NSString *phoneNum;

//是否开启声音
@property (nonatomic, assign) BOOL isSound;

//是否开启震动
@property (nonatomic, assign) BOOL isShake;

//密码
@property (nonatomic, copy) NSString *password;

//地址
@property (nonatomic, strong) NSMutableArray<NMFAddress *> *address;

//默认地址
@property (nonatomic, strong) NMFAddress *defaultAddress;

//城市
@property (nonatomic, copy) NSString *city;

//定位地址
@property (nonatomic, strong) NSDictionary *currentAddress;



//单例
+ (instancetype)currentUser;


@end
