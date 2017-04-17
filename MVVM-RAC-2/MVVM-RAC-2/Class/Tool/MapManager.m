//
//  MapManager.m
//  框架
//
//  Created by Meng Fan on 17/3/17.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "MapManager.h"

@interface MapManager () <BMKLocationServiceDelegate, BMKGeoCodeSearchDelegate>

//定位的
@property (nonatomic, strong) BMKLocationService *locServices;

//正向地理位置编码
@property (nonatomic, strong) BMKGeoCodeSearch *geoCodeSearch;


@end


@implementation MapManager

-(void)dealloc {
    self.geoCodeSearch.delegate = nil;
    self.locServices.delegate = nil;
}

#pragma mark - 
-(instancetype)init {
    self = [super init];
    if (self) {
        //初始化
        self.errorSubject = [RACSubject subject];
        self.locationSubject = [RACSubject subject];
        
        self.locServices = [[BMKLocationService alloc] init];
        self.locServices.delegate = self;
        
        //设置定位条件（精度等等）
        self.locServices.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        self.locServices.distanceFilter = 200;
    }
    return self;
}



#pragma mark -

//单例
+ (instancetype)manager {
    static MapManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MapManager alloc] init];
    });
    return manager;
}

//开始定位
- (void)startUserLocation {
    [self.locServices startUserLocationService];
}

//停止定位
- (void)stopUserLocation {
    [self.locServices stopUserLocationService];
}

#pragma mark - BMKLocationServiceDelegate

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
*/
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation {
   if (userLocation) {
        self.w_lng = userLocation.location.coordinate.longitude;
        self.w_lat = userLocation.location.coordinate.latitude;
        
        NSLog(@"lng = %f, lat = %f", self.w_lng, self.w_lat);
        
       //反编码地理位置
        BMKReverseGeoCodeOption *reverseGeo = [[BMKReverseGeoCodeOption alloc] init];
        reverseGeo.reverseGeoPoint = CLLocationCoordinate2DMake(self.w_lat, self.w_lng);
        [self.geoCodeSearch reverseGeoCode:reverseGeo];
    }
}
 

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error {
    NSLog(@"定位失败error-%@", error);
    [self.errorSubject sendNext:error];
    [self.locServices stopUserLocationService];
}



#pragma mark - BMKGeoCodeSearchDelegate

/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
*/
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error {
    if (error == BMK_SEARCH_NO_ERROR) {
        NSLog(@"address___result=%@", result.address);
        
        if (result.poiList.count != 0) {
            //有结果且不为空
            BMKPoiInfo *poiInfo = [result.poiList firstObject];
            
            NSString *nameStr = @"";
            NSString *cityStr = @"";
            NSString *subLocalityStr = @"";
            NSString *administrativeAreaStr = @"";
            
            //具体地址
            nameStr = poiInfo.name;
            //县
            subLocalityStr = result.addressDetail.district;
            //城市
            cityStr = poiInfo.city;
            //省份
            administrativeAreaStr = result.addressDetail.province;
            NSLog(@"地址：%@ %@ %@", administrativeAreaStr, cityStr, subLocalityStr);
            
            //给User单例赋值
            CURRENT_USER.city = cityStr;
            NSDictionary *dic = @{@"address":@{@"admin":administrativeAreaStr,@"city":cityStr,@"county":subLocalityStr,@"detail":nameStr},
                                  @"lat":@(poiInfo.pt.latitude),
                                  @"lng":@(poiInfo.pt.longitude)};
            CURRENT_USER.currentAddress = dic;
            
            [self.locationSubject sendNext:dic];
        
        }
        
        //停止定位
        [self stopUserLocation];
    }
}
 
#pragma mark - LazyLoading
-(BMKGeoCodeSearch *)geoCodeSearch {
    if (!_geoCodeSearch) {
        _geoCodeSearch = [[BMKGeoCodeSearch alloc] init];
        _geoCodeSearch.delegate = self;
    }
    return _geoCodeSearch;
}




/*
@property(nonatomic,strong)BMKLocationService *locServices;

///正向地理编码
@property (nonatomic, strong) BMKGeoCodeSearch *geoCodeSearch;

//@property(nonatomic,strong)BMKReverseGeoCodeResult *reverseGeo;

@end

@implementation MapManager

+ (instancetype)manager
{
    static MapManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MapManager alloc]init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.errorSubject = [RACSubject subject];
        self.locationSubject = [RACSubject subject];
        self.locServices = [[BMKLocationService alloc]init];
        self.locServices.delegate = self;
        self.locServices.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        self.locServices.distanceFilter = 200;
        
    }
    return self;
}

- (void)startUserLocation;
{
    [self.locServices startUserLocationService];
}
- (void)stopUserLocation
{
    [self.locServices stopUserLocationService];
}


#pragma mark - BMKLocationDelegate  定位相关
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    if (userLocation)
    {
        self.w_lng = userLocation.location.coordinate.longitude;
        self.w_lat = userLocation.location.coordinate.latitude;
        
        BMKReverseGeoCodeOption *reverseGeo = [[BMKReverseGeoCodeOption alloc]init];
        reverseGeo.reverseGeoPoint = CLLocationCoordinate2DMake(self.w_lat, self.w_lng);
        [self.geoCodeSearch reverseGeoCode:reverseGeo];
        
    }
}
- (void)didFailToLocateUserWithError:(NSError *)error
{
    //    定位失败
    NSLog(@"定位失败error-%@",error);
    [self.errorSubject sendNext:error];
    [self.locServices stopUserLocationService];
}

#pragma mark - BMKGeoCodeSearchDelegate
//反地理编码结果
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error
{
    if (error == BMK_SEARCH_NO_ERROR)
    {
        NSLog(@"address____result=%@",result.address);
        if(result.poiList.count != 0)
        {
            BMKPoiInfo *poiInfo = [result.poiList firstObject];
            NSString * nameStr = @"";
            NSString *cityStr = @"";
            NSString *subLocalityStr = @"";
            NSString *administrativeAreaStr = @"";
            
            //具体地址
            nameStr = poiInfo.name;
            //县
            subLocalityStr = result.addressDetail.district;
            //城市
            cityStr = poiInfo.city;
            //省份
            administrativeAreaStr = result.addressDetail.province;
            
            CURRENT_USER.city = cityStr;
            
            NSDictionary *dic = @{@"address":@{@"admin":administrativeAreaStr,@"city":cityStr,@"county":subLocalityStr,@"detail":nameStr},
                                  @"lat":@(poiInfo.pt.latitude),
                                  @"lng":@(poiInfo.pt.longitude)};
            CURRENT_USER.currentAddress = dic;
            [self.locationSubject sendNext:dic];
        }
        [self stopUserLocation];
    }
}

- (BMKGeoCodeSearch *)geoCodeSearch
{
    if (!_geoCodeSearch)
    {
        _geoCodeSearch = [[BMKGeoCodeSearch alloc]init];
        _geoCodeSearch.delegate = self;
    }
    return _geoCodeSearch;
}
- (void)dealloc
{
    _geoCodeSearch.delegate = nil;
    _locServices.delegate  = nil;
}
*/

@end
