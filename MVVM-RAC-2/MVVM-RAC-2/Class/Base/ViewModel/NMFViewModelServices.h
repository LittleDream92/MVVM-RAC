//
//  NMFViewModelServices.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NMFBaseViewModel;
@protocol NMFViewModelServices <NSObject>

//push 和 pop
- (void)pushViewModel:(NMFBaseViewModel *)viewModel animated:(BOOL)animated;

- (void)popViewControllerWithAnimation:(BOOL)animated;

- (void)popToRootViewModelWithAnimation:(BOOL)animated;

- (void)presentViewModel:(NMFBaseViewModel *)viewModel animated:(BOOL)animated complete:(void(^)())complete;

//模态弹出VC，用于alert
- (void)presentViewController:(UIViewController *)viewController animated:(BOOL)animated complete:(void(^)())complete;

@end
