//
//  HomeTableView.m
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeTableView.h"
#import "HomeTableViewViewModel.h"

@interface HomeTableView ()

@property (nonatomic, strong) NSArray *commonMethodArray;
@property (nonatomic, strong) NSArray *operateMethodArray;

//ViewModel
@property (nonatomic, strong) HomeTableViewViewModel *viewModel;

@end



@implementation HomeTableView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModle {
    
    self.viewModel = (HomeTableViewViewModel *)viewModle;
    return [super initWithViewModel:viewModle];
}

-(void)setupViews {
    /**
     *  RAC代替tableViewDidSelect 代理需要最后设置，否则信号无法订阅到
     */
    
}
/*
#pragma mark - 
-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifierNormal = @"HomeTableViewCell";
    
    
}
*/

-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section {
    return 40;
}

-(UIView *)rootTableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 130, 40)];
    title.textColor = [UIColor blueColor];
    [view addSubview:title];
    
    if (section == 0) {
        title.text = @"RAC-常用方法";
        title.backgroundColor = [UIColor colorWithHexString:@"3182D9" alpha:0.6];
        return view;
    }else {
        title.text = @"RAC-操作方法";
        title.backgroundColor = [UIColor colorWithHexString:@"C93F45" alpha:0.6];
        return view;
    }
    
    return nil;
}


@end
