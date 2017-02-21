//
//  BaseTabView.h
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewProtocol.h"

@interface BaseTabView : UIView <BaseViewProtocol>

@property (nonatomic, strong) UITableView *tableView;

/** 表格行数数组 */
@property (nonatomic, strong) NSMutableArray *rowArray;
/** 表格组数数组 */
@property (nonatomic, assign)NSInteger sectionSum;

/** row的高度 */
@property (nonatomic, strong) NSMutableArray *rowHeighthArray;

@property (nonatomic, assign) NSInteger tableViewStyle;
@property (nonatomic, assign) CGRect tabFrame;



- (UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)rootTableView:(UITableView *)tableView rootHeightForFooterInSection:(NSInteger)section;
- (CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section;
- (UIView *)rootTableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
- (UIView *)rootTableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;

- (CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (void)rootTableView:(UITableView *)tableView didSelectedRowAtIndexPath:(NSIndexPath *)indexPath;

@end
