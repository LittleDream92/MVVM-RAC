//
//  NMFViewModelNavigationImpl.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NMFViewModelNavigationImpl : NSObject <NMFViewModelServices>

@property (nonatomic, copy) NSString *className;

//设置当前root VC
@property (nonatomic, assign) NSInteger selectedIndex;

- (instancetype)initWithNavigationController:(UINavigationController *)navi;

@end
