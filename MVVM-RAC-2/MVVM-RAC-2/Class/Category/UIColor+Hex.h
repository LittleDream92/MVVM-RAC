//
//  UIColor+Hex.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)


/**
 根据16进制字符串返回UIColor
 
 @param hex 16进制字符串
 @return Color
 */
+ (UIColor *)colorWithHex:(long)hex;
+ (UIColor *)colorWithHexStr:(NSString *)hex;
+ (UIColor *)colorWithHex:(long)hex alpha:(float)alpha;


//----------
+ (UIColor *)colorWithHexString:(NSString *)color;

/** 带alpha的 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
