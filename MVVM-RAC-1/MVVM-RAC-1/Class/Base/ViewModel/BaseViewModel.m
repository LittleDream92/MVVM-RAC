//
//  BaseViewModel.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/24.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

-(instancetype)initWithViewModel:(id)viewModel {
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)initialze {
    
}

+(instancetype)alloc {
    BaseViewModel *viewModel = [super alloc];
    if (viewModel) {
        [viewModel initialze];
    }
    return viewModel;
}

@end
