//
//  NMFMeViewController.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/1.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFMeViewController.h"
#import "NMFMeHeaderView.h"
#import "NMFMeTableViewCell.h"
#import "MeBtn.h"

#define FOOT_ID1 @"FOOT1"
#define FOOT_ID2 @"FOOT2"

@interface NMFMeViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

//头视图
@property (nonatomic, strong) NMFMeHeaderView *headView;

/** 设置按钮 */
@property (nonatomic, strong) UIButton *setBtn;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, assign) BOOL dismissFlag;

//viewModel
@property (nonatomic, strong) NMFMeViewModel *viewModel;

@end

@implementation NMFMeViewController

#pragma mark - lifeCycle
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.dismissFlag = NO;
    self.tableView.contentOffset = CGPointMake(self.tableView.contentOffset.x, self.tableView.contentOffset.y + 0.02);
    [self.tableView reloadData];
    [_headView upDate];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    self.dismissFlag = YES;
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:NMFCOLOR(255, 255, 255, 0.99)] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self bindViewModel];
    [self setupViews];
    [self resetNavi];
}


#pragma mark - UI
- (void)setupViews {
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    _titleArray = @[@"推荐有奖",@"意见反馈",@"客服热线",@"酒运达"];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"NMFMeTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.tableView.tableHeaderView = self.headView;
}

- (void)resetNavi {
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    [self.setBtn setBackgroundImage:[UIImage imageNamed:@"w_shezhi"] forState:UIControlStateNormal];
    self.setBtn.frame = CGRectMake(0, 0, 25, 23);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.setBtn];
}


/** 滑动tableView，更新导航栏 */
- (void)updateNavi:(id)x {
    if (self.dismissFlag) {
        return;
    }
    
    CGPoint point = [x CGPointValue];
    CGFloat y = point.y;
    if (y < 0)
    {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    }
    else
    {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    }
    
    if (y >= 0)
    {
        float a = y / kWidth / 0.23 > 0.9 ? 0.9 : y / kWidth / 0.23;
        NSLog(@"%f",a);
        self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:NMFCOLOR(70, 70, 70, a)};
        if (a < 0.9 && a >= 0)
        {
            NSLog(@"11111");
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageFromColor:NMFCOLOR(255, 255, 255, a)] forBarMetrics:UIBarMetricsDefault];
        }
        if (a < 0.5)
        {
            NSLog(@"22222");
            self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
            [self.setBtn setBackgroundImage:[UIImage imageNamed:@"w_shezhi"] forState:UIControlStateNormal];
        }
        else
        {
            NSLog(@"333333");
            self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
            [self.setBtn setBackgroundImage:[UIImage imageNamed:@"w_shezhih"] forState:UIControlStateNormal];
        }
    }

}


/** 绑定View Model */
- (void)bindViewModel {
    [super bindViewModel];
    
    @weakify(self);
    [RACObserve(self.tableView, contentOffset) subscribeNext:^(id x) {
        @strongify(self);
        [self updateNavi:x];
    }];
    
    [[self.setBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.settingSubject sendNext:x];
    }];

}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0 || section == 1) ? 1 : 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NMFMeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    if (indexPath.section == 0) {
        
        [cell updataTitle:@"我的订单" subTitle:@"查看全部订单"];
        
    } else if (indexPath.section == 1) {
        
        [cell updataTitle:@"我的钱包" subTitle:@"查看明细"];
        
    } else {
        
        [cell updataTitle:self.titleArray[indexPath.row] subTitle:@""];
        if (indexPath.row == 2) {
            
            [cell updataTitle:self.titleArray[indexPath.row] subTitle:@"QQ81520140"];
            
        }
        
    }
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footView;
    
    if (section == 2) {
        footView = [[UIView alloc] initWithFrame:CGRectZero];
    } else {
        //复用footView
        if (section == 0) {
            footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FOOT_ID1];
        } else {
            footView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:FOOT_ID2];
        }
        
        //第一次时创建footview（由于这两个结构相同，都是4个按钮，因此可以这样写，不然就更复杂）
        if (!footView) {
            footView        = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 95)];
            NSArray *titleLabelArray = section == 0 ? @[@"待支付",@"配送中",@"已配送",@"待评价"] : @[@"积分",@"酒库",@"优惠券",@"酒券"];
            NSArray *imgArray   = section == 0 ? @[@"w_daizhifu",@"w_peisongzhong",@"w_yipeisong",@"w_daipingjia"] : @[@"w_jifen",@"w_jiuku",@"w_youhuiquan",@"w_jiuquan"];
            CGFloat height  = 80;
            CGFloat width   = kWidth / 4.0;
            @weakify(self);
            [titleLabelArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                MeBtn *btn = [MeBtn buttonWithTitle:obj imageName:imgArray[idx]];
                btn.tag = idx;
                [btn setFrame:CGRectMake(idx * width, 0, width, height)];
                //action
                [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
                    
                    @strongify(self);
                    [self.viewModel.headClickSubject sendNext:@(idx + section * 4)];
                    
                }];
                [footView addSubview:btn];
                if (idx == 3 && section == 0) {
                    btn.bageValue = 2;
                }
            }];
            
            //假的section 分割View
            UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, 79.4, kWidth, 15.6)];
            bottomView.backgroundColor = BASE_COLOR;
            [footView addSubview:bottomView];
        }
    }
    
    
    return footView;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == 2 ? CGFLOAT_MIN : 95;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 2) {
        //        客服热线
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"拨打" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSURL *url = [NSURL URLWithString:@"telprompt://10086"];
            [[UIApplication sharedApplication] openURL:url];
        }];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"客服热线" message:@"全国客服热线：10086" preferredStyle:UIAlertControllerStyleActionSheet];
        [alert addAction:action];
        [alert addAction:cancelAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    });
}

#pragma mark - lazyLoading
-(UITableView *)tableView {
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49) style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor whiteColor];
        
    }
    return _tableView;
}


-(NMFMeHeaderView *)headView {
    if (!_headView) {
        _headView = [[NMFMeHeaderView alloc] initWithFrame:CGRectMake(0, 0, kWidth, 200)];
    }
    return _headView;
}

-(UIButton *)setBtn {
    if (!_setBtn) {
        _setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    return _setBtn;
}



#pragma mark -
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
