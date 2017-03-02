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

- (void)pushViewModel:(NMFBaseViewModel *)viewModel animated:(BOOL)animated;

@end
