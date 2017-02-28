//
//  HomeViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/22.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "HomeTableView.h"

#import "HomeTableViewViewModel.h"

@interface HomeViewController ()

@property (nonatomic, strong) HomeView *homeTopView;
@property (nonatomic, strong) HomeTableView *homeTableView;

@property (nonatomic, strong) HomeTableViewViewModel *viewModel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(HomeTableViewViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeTableViewViewModel alloc] init];
    }
    return _viewModel;
}


#pragma mark -
-(void)addSubViews {
    
    self.homeTopView = [[HomeView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
    [self.view addSubview:self.homeTopView];
    
    self.homeTableView = [[HomeTableView alloc] initWithViewModel:self.viewModel];
    self.homeTableView.frame = CGRectMake(0, 300, SCREEN_WIDTH, SCREEN_HEIGHT-300);
    [self.view addSubview:self.homeTableView];
}


#pragma mark -
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = YES;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
