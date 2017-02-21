//
//  BaseViewModelProtocol.h
//  nmf
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseRequest.h"
@protocol BaseViewModelProtocol <NSObject>

@optional
- (instancetype)initWithModel:(id)modle;
@property (nonatomic, strong) BaseRequest *request;

/**
 *  初始化
 */
- (void)initializa;

@end
