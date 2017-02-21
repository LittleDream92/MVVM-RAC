//
//  BaseViewControllrtProtocol.h
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewControllrtProtocol <NSObject>

@optional
/**
 *  添加控件
 */
- (void)addSubViews;


/**
 *  绑定
 */
- (void)bindViewModel;


/**
 *  设置navigation
 */
- (void)layoutNavigation;


/**
 *  初次获取数据
 */
- (void)getNewData;

@end
