//
//  NMFBaseViewModel.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFBaseViewModel.h"

@interface NMFBaseViewModel ()

@property (nonatomic, strong, readwrite) id<NMFViewModelServices> services;
@property (nonatomic, copy, readwrite) NSDictionary *params;

@end



@implementation NMFBaseViewModel

/** 自定义初始化方法 */
- (instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params {
    
    self = [super init];
    if (self) {
        self.title = params[@"title"];
        self.services = service;
        self.params = params;
    }
    return self;
}

@end
