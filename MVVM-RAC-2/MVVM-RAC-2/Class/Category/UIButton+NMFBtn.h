//
//  UIButton+NMFBtn.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (NMFBtn)


/**
 快速创建文字Button

 @param frame frame
 @param title title
 @param backgroundColor 背景颜色
 @param titleColor 文字颜色
 @param titleFont 文字大小
 @return id
 */
+ (instancetype)createCustomButtonWithFrame:(CGRect)frame
                                      title:(NSString *)title
                            backGroungColor:(UIColor *)backgroundColor
                                 titleColor:(UIColor *)titleColor
                                       font:(UIFont *)titleFont;


@end
