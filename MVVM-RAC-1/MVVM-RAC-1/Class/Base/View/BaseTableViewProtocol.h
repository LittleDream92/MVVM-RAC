//
//  BaseTableViewProtocol.h
//  Tab
//
//  Created by Meng Fan on 17/2/23.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseViewModelProtocol;
@protocol BaseTableViewProtocol <NSObject>

@optional

- (instancetype)initWithViewModel:(id <BaseViewModelProtocol>)viewModel;

- (void)bindWithViewModel;

/** 添加视图 */
- (void)addChildView;

@end
