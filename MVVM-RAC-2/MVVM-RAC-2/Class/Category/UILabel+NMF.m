//
//  UILabel+NMF.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "UILabel+NMF.h"

@implementation UILabel (NMF)

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
          range:(NSRange)range {
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    [str addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    self.attributedText = str;
}


- (void)setText:(NSString *)text
           font:(UIFont *)font
      withColor:(UIColor *)color
          color:(UIColor *)color2
          range:(NSRange)range
          range:(NSRange)range2 {
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttribute:NSForegroundColorAttributeName value:color range:range];
    [str addAttribute:NSForegroundColorAttributeName value:color2 range:range2];
    [str addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    self.attributedText = str;
    
}

@end
