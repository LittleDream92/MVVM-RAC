//
//  UIFont+NMF.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (NMF)

/**
 *  设置正常字体
 */
+ (UIFont *)nmfNormalFont:(CGFloat)size;

/**
 *  设置加粗字体
 */
+ (UIFont *)nmfBlodFont:(CGFloat)size;

@end
