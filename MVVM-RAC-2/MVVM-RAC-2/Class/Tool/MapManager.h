//
//  MapManager.h
//  框架
//
//  Created by Meng Fan on 17/3/17.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MapManager : NSObject

//定位失败
@property (nonatomic, strong) RACSubject *errorSubject;

//定位成功
@property (nonatomic, strong) RACSubject *locationSubject;

//经度
@property (nonatomic, assign) double w_lng;

//纬度
@property (nonatomic, assign) double w_lat;


//单例
+ (instancetype)manager;

//开始定位
- (void)startUserLocation;

//停止定位
- (void)stopUserLocation;

@end
