//
//  ShoppingManager.m
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "ShoppingManager.h"
#import <objc/runtime.h>

@implementation ShoppingManager

//单例
+ (instancetype)manager {
    static ShoppingManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ShoppingManager alloc] init];
    });
    
    return manager;
}


//刷新购物车物品（删除已经购买的）
- (void)refreshGoods {
    NSArray *goodArray          = [self.goodsDic allValues];
    [self.goodsDic removeAllObjects];
    [goodArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        Good *good = obj;
        if (!good.w_isSelected)
        {
            self.goodsDic[good.id] = good;
        }
        else
        {
            CURRENT_USER.bageValue -= good.num;
        }
        if (idx == goodArray.count - 1)
        {
            [DataManager saveUserData];
        }
    }];

}

- (NSMutableDictionary *)goodsDic
{
    if (!self.flag)
    {
        self.changed = [NSString stringWithFormat:@"%d",15];
    }
    return _goodsDic;
}


#pragma mark - coding
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    unsigned int count = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++)
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
    
    for (int i = 0 ; i < count; i++)
    {
        objc_property_t pro = propertyList[i];
        const char *name   = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}

@end
