//
//  MFTextField.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/28.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "MFTextField.h"

@implementation MFTextField

-(instancetype)initWithFrame:(CGRect)frame icon:(UIImageView *)icon {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.leftView = icon;
        self.leftViewMode = UITextFieldViewModeAlways;
    }
    
    return self;
}

//
-(CGRect)leftViewRectForBounds:(CGRect)bounds {
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 10;    //右边偏 10
    
    return iconRect;
}

@end
