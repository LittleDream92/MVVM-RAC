//
//  HomeTableView.m
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeTableViewCell.h"

#import "HomeTableViewViewModel.h"

@interface HomeTableView ()

@property (nonatomic,strong) NSArray *commonMethodArray;
@property (nonatomic,strong) NSArray *operateMethodArray;

//ViewModel
@property (nonatomic, strong) HomeTableViewViewModel *viewModel;

@end

#define LoginViewControllerURL @"dariel://Loginitem"
#define ChangeViewControllerURl @"dariel://Changeitem"

@implementation HomeTableView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self.viewModel = (HomeTableViewViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
}

#pragma mark - 假 Data
-(NSArray *)commonMethodArray {
    if (!_commonMethodArray) {
        _commonMethodArray = @[@"push viewController(viewManger)",
                               @"rac_textfield and Raccommand(RAC)",
                               @"rac_signalForSelector: (TableviewDelegate)",
                               @"rac_valuesAndChangesForKeyPath(KVO)",
                               @"rac_signal combineLatest"
                               ];
    }
    return _commonMethodArray;
}

-(NSArray *)operateMethodArray {
    if (!_operateMethodArray) {
        _operateMethodArray = @[@"flattenMap 根据前一个信号的参数创建一个新的信号！",
                                @"concat 组合 按一定顺序拼接信号，当多个信号发出的时候，有顺序的接收信号",
                                @"then 用于连接两个信号，当第一个信号完成，才会连接then返回的信号。",
                                @"merge 把多个信号合并为一个信号，任何一个信号有新值的时候就会调用",
                                @"zipWith 把两个信号压缩成一个信号，只有当两个信号同时发出信号内容时，并且把两个信号的内容合并成一个元组，才会触发压缩流的next事件。",
                                @"reduce 用于信号发出的内容是元组，把信号发出元组的值聚合成一个值",
                                @"filter 过滤信号，使用它可以获取满足条件的信号.",
                                @"ignore 忽略完某些值的信号.",
                                @"distinctUntilChanged",
                                @"take:从开始一共取N次的信号",
                                @"takeLast:取最后N次的信号,前提条件，订阅者必须调用完成，因为只有完成，就知道总共有多少信号.",
                                @"takeUntil:(RACSignal *):获取信号直到某个信号执行完成",
                                @"skip:(NSUInteger):跳过几个信号,不接受。",
                                @"switchToLatest:用于signalOfSignals（信号的信号），有时候信号也会发出信号，会在signalOfSignals中，获取signalOfSignals发送的最新信号。",
                                @"doNext: 执行Next之前，会先执行这个Block",
                                @"doCompleted: 执行sendCompleted之前，会先执行这个Block",
                                @"timeout：超时，可以让一个信号在一定的时间后，自动报错。",
                                @"interval 定时：每隔一段时间发出信号",
                                @"delay 延迟发送next",
                                @"retry重试 ：只要失败，就会重新执行创建信号中的block,直到成功.",
                                @"replay重放：当一个信号被多次订阅,反复播放内容",
                                @"throttle节流:当某个信号发送比较频繁时，可以使用节流，在某一段时间不发送信号内容，过了一段时间获取信号的最新内容发出。"
                                
                                ];
    }
    return _operateMethodArray;
}

#pragma mark - UI
-(void)addChildView {
    
    //用RAC代替selectedCell方法
    [self clickCellAction];
    
    self.tabFrame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-300);
    self.tableViewStyle = 0;
    self.sectionSum = 2;
    
    self.rowArray = [NSMutableArray arrayWithObjects:self.commonMethodArray,self.operateMethodArray, nil];
    
    //设置row的高度值,此处是写的固定的，两个组，每一组中的行高是相同的，但是每一行不同的时候怎么设置呢！！思考，可以每组中相同的写一个元素，判断，不同的就写不同的数字，判断。
    self.rowHeightArray = [NSMutableArray arrayWithArray:@[@"80",
                                                           @"80"]];
    
    [super addChildView];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    //赋值
    cell.titleLabel.text = self.rowArray[indexPath.section][indexPath.row];
    [cell cellAutoLayoutHeight:self.rowArray[indexPath.section][indexPath.row]];
    
    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForHeaderInSection:(NSInteger)section {
    return 40;
}


-(UIView *)rootTableView:(UITableView *)tableView rootViewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc]init];
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 130, 40)];
    title.textColor = [UIColor blueColor];
    ;
    [view addSubview:title];
    if (section == 0) {
        title.text = @"RAC--常用方法";
        title.backgroundColor = [UIColor colorWithHexString:@"3182D9" alpha:0.6];
        return view;
    }else{
        title.text = @"RAC--操作方法";
        title.backgroundColor = [UIColor colorWithHexString:@"C93F45" alpha:0.6];
        return view;
        
    }
    return nil;
}

#pragma mark - Action
//用RAC代替selectedCell方法
//⚠️代理需要最后设置，否则信号无法订阅到
- (void)clickCellAction {
    //RACTuple
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple *x) {
        
        NSIndexPath *indexPath = x.second;
        NSLog(@"%ld _ %ld", (long)indexPath.section, (long)indexPath.row);
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                
                [DCURLRouter pushURLString:LoginViewControllerURL animated:YES];
                
            } else if(indexPath.row == 1) {
                
                [DCURLRouter pushURLString:[NSString stringWithFormat:@"%@?title=点击", ChangeViewControllerURl] animated:YES];
                
            } else if (indexPath.row == 2) {
                
                [DCURLRouter pushURLString:[NSString stringWithFormat:@"%@?title=合并", ChangeViewControllerURl] animated:YES];
                
            } else if (indexPath.row == 3) {
                LXAlertView *alert = [[LXAlertView alloc] initWithTitle:@"提示" message:@"This is a alertView" cancelBtnTitle:@"取消" otherBtnTitle:@"确定" clickIndexBlock:^(NSInteger clickIndex) {
                    NSLog(@"您点击了确定");
                }];
                [alert showLXAlertView];
            }
        } else if (indexPath.section == 1) {
            
        }
        
    }];
}


@end
