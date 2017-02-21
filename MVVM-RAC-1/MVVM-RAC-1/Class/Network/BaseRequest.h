//
//  BaseRequest.h
//  nmf
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface BaseRequest : AFHTTPSessionManager

/** 添加构造方法 */
- (instancetype)initWithToken;

- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            success:(void(^)(id responseData))success
            failure:(void(^)(NSError *error))failure
        showLoading:(BOOL)showLoading
        showMessage:(NSString *)showMessage;


@end
