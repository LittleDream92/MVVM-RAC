//
//  AopViewController.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "AopViewController.h"
#import "AopView.h"
#import "AspectCatModel.h"

#import <objc/runtime.h>

@interface AopViewController ()

@end

@implementation AopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"AopViewController";
    
    /** AOP是面相切片编程的简称，主要功能是日志记录、性能统计、安全控制、事物处理、异常处理等等 */
    [self addChildView];
    [self initAspect];
}

#pragma mark - UI
-(void)addChildView{
    AopView *view = [[AopView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:view];
}



#pragma mark - AOP 日志
/*Aspects实现类方法拦截*/
-(void)initAspect{
    
    Class catMetal = objc_getMetaClass(NSStringFromClass(AspectCatModel.class).UTF8String);
    
    [catMetal aspect_hookSelector:@selector(classFee) withOptions:AspectPositionAfter usingBlock:^{
        
        NSLog(@"aspectFee");
        
    } error:NULL];
    
    [AspectCatModel classFee];
    
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
