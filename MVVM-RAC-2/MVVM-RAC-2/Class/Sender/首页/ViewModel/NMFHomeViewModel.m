//
//  NMFHomeViewModel.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFHomeViewModel.h"

@implementation NMFHomeViewModel

-(instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params {
    self = [super initWithService:service params:params];
    if (self) {
        [self setupViewModel];
    }
    return self;
}

- (void)setupViewModel {
    @weakify(self);
    
    //刷新
    self.refreshCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        @strongify(self);
        
        SHOW_SVP(@"加载中");
        
//        RACSignal *signal2 = [];
        
        RACSignal *signal3;
        
        return signal3;
    }];
}

@end
