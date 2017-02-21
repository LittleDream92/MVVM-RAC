//
//  BaseViewModel.m
//  nmf
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

@synthesize request = _request;
+(instancetype)alloc {
    BaseViewModel *viewModel = [super alloc];
    if (viewModel) {
        [viewModel initializa];
    }
    return viewModel;
}

-(instancetype)initWithModel:(id)modle {
    self = [super init];
    if (self) {
    }
    return self;
}



-(BaseRequest *)request {
    if (!_request) {
        _request = [[BaseRequest alloc] init];
    }
    
    return _request;
}


/** 初始化 */
-(void)initializa {
    
}

@end
