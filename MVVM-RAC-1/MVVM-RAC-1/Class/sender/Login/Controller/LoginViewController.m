//
//  LoginViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/24.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginViewModel.h"
#import "LoginView.h"

#import "RegistViewController.h"

@interface LoginViewController ()

@property (nonatomic, strong) LoginView *loginView;
@property (nonatomic, strong) LoginViewModel *viewModel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"LoginViewController";
    self.view.backgroundColor = [UIColor brownColor];
    
    [self setupViews];
    [self registViewModel];
}

#pragma mark - UI
- (void)setupViews {
    self.loginView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.loginView];
}

#pragma mark - Action
//绑定View Model事件
- (void)registViewModel {
    //属性绑定（一般用于绑定textField字符串内容）
    RAC(self.viewModel, userName) = self.loginView.usernameTextField.rac_textSignal;
    RAC(self.viewModel, password) = self.loginView.passwordTextField.rac_textSignal;
    
    //登录
    self.loginView.loginButton.rac_command = self.viewModel.loginCommond;
    //可以对登录操作的信号进行订阅
    [[self.viewModel.loginCommond executionSignals] subscribeNext:^(RACSignal *x) {
        //可以在此处设置loading
        
        [x subscribeNext:^(NSString *x) {
            NSLog(@"正在网络加载:%@", x);
            if (x == nil) {
                return ;
            }
            [self performSelector:@selector(popHomeVC) withObject:self afterDelay:0.2];
        }];
    }];
    
    //注册(最简单的跳转)
    self.loginView.registButton.rac_command = self.viewModel.registCommond;
}

//关闭本页面
-(void)popHomeVC{
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -lazyLoading
-(LoginView *)loginView {
    if (!_loginView) {
        _loginView = [[LoginView alloc] init];
    }
    return _loginView;
}

-(LoginViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[LoginViewModel alloc] init];
    }
    return _viewModel;
}

#pragma mark -
-(void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBar.hidden = NO;
}


#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
