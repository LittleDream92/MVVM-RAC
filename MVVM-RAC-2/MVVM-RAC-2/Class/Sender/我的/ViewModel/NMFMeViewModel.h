//
//  NMFMeViewModel.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFBaseViewModel.h"

@interface NMFMeViewModel : NMFBaseViewModel

/** cell点击 */
@property (nonatomic, strong) RACSubject *cellClickSubject;

/** head点击 */
@property (nonatomic, strong) RACSubject *headClickSubject;

/** 设置按钮点击 */
@property (nonatomic, strong) RACSubject *settingSubject;

@end
