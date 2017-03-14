//
//  MeBtn.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/14.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeBtn : UIButton

/**
 *  左上的提示(几个订单之类的)
 */
@property (nonatomic, assign) NSInteger bageValue;

/**
 *  构建方法，最低高度65
 */
+ (instancetype)buttonWithTitle:(NSString *)title imageName:(NSString *)imageName;

@end
