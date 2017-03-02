//
//  BaseViewController.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong, readwrite) NMFBaseViewModel *viewModel;

@end

@implementation BaseViewController

//自定义初始化方法
- (instancetype)initWithViewModel:(NMFBaseViewModel *)viewModel {
    self = [super init];
    
    if (self) {
        
        self.viewModel = viewModel;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


//绑定ViewModel
- (void)bindViewModel {
    
    RAC(self.navigationItem, title) = RACObserve(self.viewModel, title);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
