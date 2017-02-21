//
//  RootViewProtocol.h
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RootViewProtocol <NSObject>

@optional
-(instancetype)initWithFrame:(CGRect)frame;

/**
 *  添加视图
 */
-(void)addChildView;


@end
