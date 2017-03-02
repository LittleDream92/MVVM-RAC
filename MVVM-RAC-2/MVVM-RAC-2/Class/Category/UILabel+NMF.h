//
//  UILabel+NMF.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (NMF)

//自我感觉没有我封装的好，我封装的事range是在这里计算的，我只需传入颜色和颜色的文本即可。


/**
 设置文字 大小 颜色区间

 @param text 文字
 @param font 字体
 @param color 字体颜色
 @param range 字体颜色的区间
 */

- (void)setText:(NSString *)text
           font:(UIFont *)font
      withColor:(UIColor *)color
          range:(NSRange)range;


- (void)setText:(NSString *)text
           font:(UIFont *)font
      withColor:(UIColor *)color
          color:(UIColor *)color2
          range:(NSRange)range
          range:(NSRange)range2;



@end
