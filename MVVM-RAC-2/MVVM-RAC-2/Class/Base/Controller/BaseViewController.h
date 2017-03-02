//
//  BaseViewController.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


//自定义初始化方法
- (instancetype)initWithViewModel:(NMFBaseViewModel *)viewModel;

@end
