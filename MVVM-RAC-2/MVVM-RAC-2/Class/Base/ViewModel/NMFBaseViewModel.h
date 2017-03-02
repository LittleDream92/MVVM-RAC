//
//  NMFBaseViewModel.h
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMFViewModelServices.h"

@interface NMFBaseViewModel : NSObject

@property (nonatomic, copy) NSString *title;

/** 自定义初始化方法 */
- (instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params;

@end
