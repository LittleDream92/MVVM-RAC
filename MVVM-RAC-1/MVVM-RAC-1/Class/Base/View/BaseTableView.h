//
//  BaseTableView.h
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTableViewProtocol.h"

@interface BaseTableView : UIView <BaseTableViewProtocol>

@property (nonatomic, strong) UITableView *tableView;

/** 行数的数组 */
@property (nonatomic, strong) NSMutableArray *rowArray;

/** 组数 */
@property (nonatomic, assign) NSInteger sectionSum;

/** tableView样式 */
@property (nonatomic, assign) NSInteger tableViewStyle;
/** tableView frame */
@property (nonatomic, assign) CGRect tabFrame;
/** tableView行高的数组 */
@property (nonatomic, strong) NSMutableArray *rowHeightArray;


-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForHeaderInSection:(NSInteger)section;
-(UIView *)rootTableView:(UITableView *)tableView rootViewForFooterInSection:(NSInteger)section;
-(UIView *)rootTableView:(UITableView *)tableView rootViewForHeaderInSection:(NSInteger)section;
-(CGFloat)rootTableView:(UITableView *)tableView rootHeightForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)rootTableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;


@end
