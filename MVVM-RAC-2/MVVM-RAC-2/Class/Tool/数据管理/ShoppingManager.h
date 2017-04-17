//
//  ShoppingManager.h
//  框架
//
//  Created by Meng Fan on 17/3/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingManager : NSObject <NSCoding>

//商品
@property(nonatomic, strong) NSMutableDictionary *goodsDic;

//记录购物车改变
@property(nonatomic, copy) NSString *changed;

//标志是添加至购物车还是监听  NO-ADD
@property(nonatomic, assign) BOOL flag;

//当前购物车已选择的总价
@property(nonatomic, assign) CGFloat price;



//单例
+ (instancetype)manager;

//刷新购物车物品（删除已经购买的）
- (void)refreshGoods;

@end
