//
//  UIColor+Hex.h
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

/**
 *  从十六进制字符串获取颜色
 */
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end
