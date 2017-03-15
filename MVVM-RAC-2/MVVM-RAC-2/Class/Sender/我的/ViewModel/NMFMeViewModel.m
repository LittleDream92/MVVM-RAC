//
//  NMFMeViewModel.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/2.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFMeViewModel.h"

@implementation NMFMeViewModel

-(instancetype)initWithService:(id<NMFViewModelServices>)service params:(NSDictionary *)params
{
    self = [super initWithService:service params:params];
    if (self) {
        [self initViewModel];
    }
    return self;
}

- (void)initViewModel
{
    /** cell点击 */
    self.cellClickSubject = [RACSubject subject];
    [self.cellClickSubject subscribeNext:^(id x) {
        
    }];
    
    /** head点击 */
    self.headClickSubject = [RACSubject subject];
    [self.headClickSubject subscribeNext:^(id x) {
        NSLog(@"head点击%@", x);
        NSInteger num = [x integerValue];
        switch (num) {
            case 4:
            case 5:
            case 6:
            case 7:
            {
//                积分    酒库   优惠券    酒券
                SHOW_ERROE(@"敬请期待");
                DISMISS_SVP(1.2);
            }
                break;
            case 8:
            {
                //点击头像
                if ([self judgeWhetherLogin:YES]) {
                    
                    NSLog(@"yes");
                    
                } else {
                    NSLog(@"no");
                }
            }
                break;
            case 9:
            {
                //收藏
            }
                break;
            case 10:
            {
                //足迹
            }
                break;
                
            default:
            {
                //订单
                NSLog(@"要push订单啦！");
            }
                break;
        }
    }];
    
    /** 设置按钮点击 */
    self.settingSubject = [RACSubject subject];
    [self.settingSubject subscribeNext:^(id x) {
        
    }];
    
}

@end
