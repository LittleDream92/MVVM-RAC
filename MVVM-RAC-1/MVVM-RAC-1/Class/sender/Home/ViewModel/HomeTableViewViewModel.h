//
//  HomeTableViewViewModel.h
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/24.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@interface HomeTableViewViewModel : BaseViewModel

//cell的点击事件
@property (nonatomic, strong) RACSubject *cellClickSubject;
@property (nonatomic, strong) RACCommand *cellClickCommond;

@end
