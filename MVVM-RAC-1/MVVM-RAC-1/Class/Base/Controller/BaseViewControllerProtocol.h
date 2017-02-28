//
//  BaseViewControllerProtocol.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/22.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewControllerProtocol <NSObject>

@optional

/** 绑定 */
- (void)bindViewModel;

/** 添加视图 */
- (void)addSubViews;

/** 设置navigation */
- (void)layoutNavigation;

/** 初次获取数据 */
- (void)getNewData;

@end
