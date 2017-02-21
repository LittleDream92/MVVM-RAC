//
//  BaseTabView.m
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseTabView.h"

@interface BaseTabView ()   <UITableViewDelegate, UITableViewDataSource>
@end


@implementation BaseTabView


-(instancetype)init {
    self = [super init];
    if (self) {
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}


-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModle {
    self = [super init];
    if (self) {
        [self setupViews];
        [self bindViewModel];
    }
    return self;
}



#pragma mark - protocol
-(void)setupViews {
    self.tableView = [[UITableView alloc] initWithFrame:(self.tabFrame) style:(self.tableViewStyle)];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self addSubview:self.tableView];
    
    self.tableView.contentInset = UIEdgeInsetsZero;
}

-(void)bindViewModel {
    
}


#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionSum;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger row = [self.rowArray[section] count];
    return row;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self rootTableView:tableView rootCellForRowAtIndexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self rootTableView:tableView heightForRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self rootTableView:tableView rootHeightForFooterInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self rootTableView:tableView rootHForHeaderInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self rootTableView:tableView viewForFooterInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self rootTableView:tableView viewForHeaderInSection:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self rootTableView:tableView didSelectedRowAtIndexPath:indexPath];
}


#pragma mark - Public
- (UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"UITableViewCell"];
    
    return cell;
}

- (CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section {
    return 0;
}

- (UIView *)rootTableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}

- (UIView *)rootTableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}

- (CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger height = [self.rowHeighthArray[indexPath.section] integerValue];
    return height;
}

- (void)rootTableView:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
