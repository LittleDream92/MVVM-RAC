//
//  HomeViewController.m
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/16.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "HomeView.h"
#import "HomeTableViewViewModel.h"

@interface HomeViewController ()

//视图、控件
@property (nonatomic, strong) HomeView *homeTopView;
@property (nonatomic, strong) HomeTableView *mainTab;

//ViewModel
@property (nonatomic, strong) HomeTableViewViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self registEvent];
}

#pragma mark - system
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}

#pragma mark - registEvent
- (void)registEvent {
    
}


#pragma mark - 
-(void)addSubViews {
    
    self.homeTopView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.view addSubview:self.homeTopView];
    
    self.mainTab = [[HomeTableView alloc] initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
}


-(void)bindViewModel {
    
    @weakify(self);
    [[self.viewModel.cellClickSubject takeUntil:self.rac_willDeallocSignal] subscribeNext:^(id x) {
        
        @strongify(self);
        NSLog(@"登录");
        
    }];
    
}

-(void)layoutNavigation {
    
}

-(void)getNewData {
    
}

#pragma mark - lazyLoading
-(HomeTableViewViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeTableViewViewModel alloc] init];
    }
    return _viewModel;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
