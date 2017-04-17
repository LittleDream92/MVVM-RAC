//
//  NMFHomeViewModel.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFBaseViewModel.h"

@interface NMFHomeViewModel : NMFBaseViewModel

@property (nonatomic, strong) NSArray *headData;

@property (nonatomic, strong) NSArray *dataArray;

/** 刷新数据 **/
@property (nonatomic, strong) RACCommand *refreshCommand;

//头视图
@property (nonatomic, strong) RACCommand *headCommand;

//中间按钮点击


@end
