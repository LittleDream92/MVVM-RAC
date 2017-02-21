//
//  MFViewProtocol.h
//  MVVM-RAC_1
//
//  Created by Meng Fan on 17/2/20.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import<UIKit/UIKit.h>

@protocol MFViewProtocol <NSObject>

@optional

/**
 *  将View中的事件通过代理传递出去
 *
 *  @param view     view自己
 *  @param events   所触发事件的一些描述信息
 *  @param url      跳转页面的URL字符串
 */
- (void)mf_view:(__kindof UIView *)view withEvent:(NSDictionary *)events url:(NSString *)url;

@end
