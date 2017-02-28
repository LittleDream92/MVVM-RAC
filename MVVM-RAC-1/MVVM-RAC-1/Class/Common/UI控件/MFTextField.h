//
//  MFTextField.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/28.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFTextField : UITextField

//这样封装子类的话就不能使用RAC的原生监测了
-(instancetype)initWithFrame:(CGRect)frame icon:(UIImageView *)icon;

@end
