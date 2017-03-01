//
//  BaseTableView.m
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView () <UITableViewDelegate, UITableViewDataSource>



@end

@implementation BaseTableView

-(instancetype)init {
    self = [super init];
    
    if (self) {
        [self addChildView];
    }
    return self;
}

-(void)bindWithViewModel {
    
}

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel {
    self = [super init];
    if (self) {
        [self addChildView];
    }
    return self;
}

- (void)addChildView {
//    NSLog(@"%f, %f, %f, %f", self.frame.origin.x, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    self.tableView = [[UITableView alloc] initWithFrame:self.tabFrame style:self.tableViewStyle];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionSum;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.rowArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self rootTableView:tableView rootCellForRowAtIndexPath:indexPath];
}

#pragma mark - UITableViewDelegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self rootTableView:tableView rootHeightForRowAtIndexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return [self rootTableView:tableView rootHeightForFooterInSection:section];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [self rootTableView:tableView rootHeightForHeaderInSection:section];
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [self rootTableView:tableView rootViewForFooterInSection:section];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self rootTableView:tableView rootViewForHeaderInSection:section];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self rootTableView:tableView didSelectRowAtIndexPath:indexPath];
}


#pragma mark - public
-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"tableviewCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0f];
    
    return cell;
}


-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section {
    return 0;
}

-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForHeaderInSection:(NSInteger)section {
    return 0;
}

-(UIView *)rootTableView:(UITableView *)tableView rootViewForFooterInSection:(NSInteger)section {
    return nil;
}

-(UIView *)rootTableView:(UITableView *)tableView rootViewForHeaderInSection:(NSInteger)section {
    return nil;
}

-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.rowHeightArray && self.rowHeightArray.count > 0) {
        NSInteger heigth = [self.rowHeightArray[indexPath.section] integerValue];
        
        return heigth;
    } else {
        return 44;
    }
}

-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

@end
