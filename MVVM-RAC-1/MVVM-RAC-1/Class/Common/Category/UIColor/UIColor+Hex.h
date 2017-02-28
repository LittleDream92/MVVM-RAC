//
//  UIColor+Hex.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

/** 根据十六进制字符串设置颜色 */
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式开头的
+ (UIColor *)colorWithHexString:(NSString *)color;

/** 带alpha的 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;


@end
