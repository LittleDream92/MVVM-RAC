//
//  HomeTableViewViewModel.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeTableViewViewModel : BaseViewModel

/** 背景颜色 */
@property (nonatomic, copy) NSString *backgroundColor;

@property (nonatomic, strong) RACSubject *cellClickSubject;
@property (nonatomic, strong) RACCommand *cellClickCommond;


@end
