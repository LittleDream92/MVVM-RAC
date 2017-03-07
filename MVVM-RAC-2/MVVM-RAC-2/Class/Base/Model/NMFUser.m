//
//  NMFUser.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFUser.h"

#define userTag @"user"
#define userSound @"userSound"
#define userShake @"userShake"

@implementation NMFUser

//单例
+ (instancetype)currentUser {
    static NMFUser *user = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[NMFUser alloc] init];
        
        //初始化
        user.bageValue = 0;
        user.bid = @"56c45924c2fb4e2050000022";
        user.isSound = YES;
        user.isShake = YES;
        user.nickName = @"昵称";
        user.sex = YES;
        user.birthDay = @"输入后不可修改";
        user.address = @[].mutableCopy;
        user.phoneNum = @"";
    });
    
    return user;
}


-(void)setBageValue:(NSInteger)bageValue {
    _bageValue = bageValue;
    if (bageValue <= 0) {
        _bageValue = 0;
    }
}

-(BOOL)isLogin {
    if ([[NSUserDefaults standardUserDefaults] valueForKey:userTag]) {
        return YES;
    }
    return NO;
}

-(NMFAddress *)defaultAddress {
    if (!_defaultAddress) {
        if (self.address.count >= 1) {
            _defaultAddress = self.address[0];
        } else {
            _defaultAddress = [[NMFAddress alloc] init];
            _defaultAddress.n_name = CURRENT_USER.nickName;
            _defaultAddress.n_phone = CURRENT_USER.phoneNum;
            _defaultAddress.n_address = @"";
        }
    }
    return _defaultAddress;
}


//实现归档解档
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0 ; i < count; i++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([aDecoder decodeObjectForKey:key])
        {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    unsigned int count = 0;
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    for (int i = 0 ; i < count; i ++)
    {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key  = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}



@end
