//
//  RootViewProtocol.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/22.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RootViewProtocol <NSObject>

@optional
- (instancetype)initWithFrame:(CGRect)frame;

/** 添加子视图 */
- (void)addChildView;

@end
