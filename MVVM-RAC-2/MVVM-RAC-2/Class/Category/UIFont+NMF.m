//
//  UIFont+NMF.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "UIFont+NMF.h"

@implementation UIFont (NMF)

//我觉得不合理，因为他只是判断了5S、  6(S)／7、  6(s)+/7+,之外的4等不考虑啦（可能吧，因为系统支持到9.0，不过还是觉得不太妥当）。

/**
 *  设置正常字体
 */
+ (UIFont *)nmfNormalFont:(CGFloat)size {
    if (kWidth == 320 || kWidth == 640) {
        
        return [UIFont systemFontOfSize:size - 1];
    
    } else if (kWidth == 375 || kWidth == 750) {
        
        return [UIFont systemFontOfSize:size];
        
    } else {
        
        return [UIFont systemFontOfSize:size + 1];
        
    }
}

/**
 *  设置加粗字体
 */
+ (UIFont *)nmfBlodFont:(CGFloat)size {
    if (kWidth == 320 || kWidth == 640) {
        
        return [UIFont boldSystemFontOfSize:size - 1];
        
    } else if (kWidth == 375 || kWidth == 750) {
        
        return [UIFont boldSystemFontOfSize:size];
        
    } else {
        
        return [UIFont boldSystemFontOfSize:size + 1];
        
    }
}

@end
