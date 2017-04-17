//
//  NMFHomeViewController.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFHomeViewController.h"
#import "NMFSearchBar.h"
#import "NMFHomeCollectionView.h"

@interface NMFHomeViewController ()

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;

//搜索栏
@property (nonatomic, strong) NMFSearchBar *searchBar;

//collectionView
@property (nonatomic, strong) NMFHomeCollectionView *collectionView;

//ViewModel
@property (nonatomic, strong) NMFHomeViewModel *viewModel;

@end

@implementation NMFHomeViewController
@dynamic viewModel;

-(void)dealloc {
    NSLog(@"homeVC 释放了");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self resetNavigationItem];
    [self bindViewModel];
    [self setupViews];
}


#pragma mark - UI
- (void)setupViews {
    [self.view addSubview:self.collectionView];
}


- (void)resetNavigationItem {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    
    self.navigationItem.titleView = self.searchBar;
}


#pragma mark - action
-(void)bindViewModel {
    [super bindViewModel];
    
}


#pragma mark - lazyLoading
-(UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.tag = 111;
        _leftButton.frame = CGRectMake(0, 0, 25, 23);
        [_leftButton setBackgroundImage:[UIImage imageNamed:@"wtksaoyisaoh"] forState:UIControlStateNormal];
    }
    return _leftButton;
}

-(UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_rightButton setBackgroundImage:[UIImage imageNamed:@"xiaoxib"] forState:UIControlStateNormal];
        _rightButton.frame = CGRectMake(0, 0, 25, 23);
    }
    return _rightButton;
}

-(NMFSearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[NMFSearchBar alloc] initWithFrame:CGRectMake(0, 60, kWidth-120, 28)];
        _searchBar.backgroundColor = [UIColor cyanColor];
        
        //圆角
        _searchBar.layer.cornerRadius = 5;
        _searchBar.layer.masksToBounds = YES;
        
    }
    return _searchBar;
}

-(NMFHomeCollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[NMFHomeCollectionView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor brownColor];
        _collectionView.viewModel = self.viewModel;
    }
    return _collectionView;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
