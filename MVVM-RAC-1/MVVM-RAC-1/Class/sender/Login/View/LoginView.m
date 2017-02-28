//
//  LoginView.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/27.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "LoginView.h"

@interface LoginView ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *textFieldImageView;
@property (nonatomic, strong) UIImageView *lineImage;
@property (nonatomic, strong) UIImageView *usernameImage;
@property (nonatomic, strong) UIImageView *passwordImage;


@end

@implementation LoginView

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self setupViews];
    }
    return self;
}

#pragma mark - UI
- (void)setupViews {
    
    [self addSubview:self.backgroundImageView];
    [self addSubview:self.textFieldImageView];
    [self addSubview:self.lineImage];
    [self addSubview:self.loginButton];
    [self addSubview:self.registButton];
    [self.textFieldImageView addSubview:self.usernameImage];
    [self.textFieldImageView addSubview:self.passwordImage];
    [self.textFieldImageView addSubview:self.usernameTextField];
    [self.textFieldImageView addSubview:self.passwordTextField];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}


#pragma mark - frame
-(void)updateConstraints {
    
    self.backgroundImageView.sd_layout.topEqualToView(self).leftEqualToView(self).rightEqualToView(self).bottomEqualToView(self);
    self.textFieldImageView.sd_layout.leftSpaceToView(self, 50).topSpaceToView(self, 200).rightSpaceToView(self, 50).heightIs(100);
    self.lineImage.sd_layout.leftEqualToView(self.textFieldImageView).rightEqualToView(self.textFieldImageView).heightIs(1).topSpaceToView(self, 250);
    self.loginButton.sd_layout.leftEqualToView(self.textFieldImageView).rightEqualToView(self.textFieldImageView).topSpaceToView(self.textFieldImageView, 50).heightIs(43);
    self.registButton.sd_layout.leftEqualToView(self.textFieldImageView).rightEqualToView(self.textFieldImageView).topSpaceToView(self.loginButton, 10).heightIs(43);
  
    self.usernameImage.sd_layout.leftSpaceToView(self.textFieldImageView,10).topSpaceToView(self.textFieldImageView,15).widthIs(18).heightIs(21);
    self.passwordImage.sd_layout.leftSpaceToView(self.textFieldImageView,10).topSpaceToView(self.usernameImage,30).widthIs(18).heightIs(21);
    
    self.usernameTextField.sd_layout.leftSpaceToView(self.passwordImage,10).topSpaceToView(self.textFieldImageView,0).widthIs(SCREEN_WIDTH-100-30-20).heightIs(50);
    self.passwordTextField.sd_layout.leftSpaceToView(self.passwordImage,10).topSpaceToView(self.textFieldImageView,50).widthIs(SCREEN_WIDTH-100-30-20).heightIs(50);
    
    [super updateConstraints];
}


#pragma mark - lazyLoading
-(UIImageView *)backgroundImageView {
    if (!_backgroundImageView) {
        
        _backgroundImageView = [[UIImageView alloc] init];
        _backgroundImageView.image = [UIImage imageNamed:@"登录背景.jpg"];
        
    }
    return _backgroundImageView;
}

-(UIImageView *)textFieldImageView {
    if (!_textFieldImageView) {
        
        _textFieldImageView = [[UIImageView alloc] init];
        _textFieldImageView.image = [UIImage imageNamed:@"登录白背景.png"];
        _textFieldImageView.userInteractionEnabled = YES;
    }
    return _textFieldImageView;
}

-(UIImageView *)lineImage {
    if (!_lineImage) {
        
        _lineImage = [[UIImageView alloc] init];
        _lineImage.image = [UIImage imageNamed:@"登录分割线.png"];
    }
    
    return _lineImage;
}

-(UIButton *)loginButton {
    if (!_loginButton) {
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"登录按钮.png"] forState:UIControlStateNormal];
    }
    
    return _loginButton;
}

-(UIButton *)registButton {
    if (!_registButton) {
        
        _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_registButton setBackgroundImage:[UIImage imageNamed:@"注册按钮.png"] forState:UIControlStateNormal];
    }
    
    return _registButton;
}

-(UITextField *)usernameTextField {
    if (!_usernameTextField) {
        
        _usernameTextField = [[UITextField alloc] init];
        _usernameTextField.placeholder = @"请输入手机号";
        
        _usernameTextField.keyboardType = UIKeyboardTypeNumberPad;
        _usernameTextField.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _usernameTextField;
}

-(UITextField *)passwordTextField {
    if (!_passwordTextField) {
        
        _passwordTextField = [[UITextField alloc] init];
        _passwordTextField.placeholder = @"请输入登录密码";
        
        _passwordTextField.secureTextEntry = YES;
        _passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    }
    return _passwordTextField;
}


-(UIImageView *)usernameImage {
    if (!_usernameImage) {
        
        _usernameImage = [[UIImageView alloc] init];
        _usernameImage.image = [UIImage imageNamed:@"登录账号图标.png"];
    }
    return _usernameImage;
}

-(UIImageView *)passwordImage {
    if (!_passwordImage) {
    
        _passwordImage = [[UIImageView alloc] init];
        _passwordImage.image = [UIImage imageNamed:@"登录密码图标.png"];
    }
    
    return _passwordImage;
}

@end
