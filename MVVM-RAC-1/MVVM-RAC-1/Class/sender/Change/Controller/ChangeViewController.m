//
//  ChangeViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/28.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "ChangeViewController.h"
#import "RACWithKVOView.h"

@interface ChangeViewController ()

@property (nonatomic, strong) RACWithKVOView *kvoView;

@end

@implementation ChangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[self.params objectForKey:@"title"] isEqualToString:@"合并"]) {
        //合并
        [self combineLatest];
    }
    //点击
    [self monitorBackgroundColor];
}

#pragma mark -
/** 添加子视图 */
-(void)addSubViews {
    
    self.kvoView = [[RACWithKVOView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2-50, 200, 100, 100)];
    [self.kvoView.clickButton setTitle:[self.params objectForKey:@"title"] forState:UIControlStateNormal];
    [self.view addSubview:self.kvoView];
}

#pragma mark - 
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.hidden = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Change";
}

#pragma mark - action
//合并
- (void)combineLatest {
    //将多个信号合并起来，并且拿到各个信号的最新的值，必须每个合并的signal至少都有过一次sendNext，才会被触发合并的信号。
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"我想你"];
        [subscriber sendNext:@"我不想你"];
        [subscriber sendNext:@"Test"];
        
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"嗯"];
        [subscriber sendNext:@"我爱你"];
        
        return nil;
    }];
    
    
    [[self.kvoView.clickButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        //合并A和B信号
        [[RACSignal combineLatest:@[signalA, signalB]] subscribeNext:^(id x) {
            
            NSLog(@"%@", x);
            
        }];
        
    }];
}

/** 
 *  点击
 *
 *  代替KVO  监听View背景颜色的改变
 */
- (void)monitorBackgroundColor {
    
    [[self.kvoView.topView rac_valuesAndChangesForKeyPath:@"backgroundColor" options:NSKeyValueObservingOptionNew observer:nil] subscribeNext:^(id x) {
        
        NSLog(@"view.backgroundColor -Change");
        
    }];
    
}

#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
