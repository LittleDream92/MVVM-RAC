//
//  DataManager.h
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//


/**
 *  数据管理类
 */
#import <Foundation/Foundation.h>

@interface DataManager : NSObject

/**
 *  保存用户数据
 */
+ (void)saveUserData;


/** 
 *  读取用户数据
 */
+ (void)readUserData;


/**
 *  删除用户数据
 */
+ (void)removeUserData;

@end
