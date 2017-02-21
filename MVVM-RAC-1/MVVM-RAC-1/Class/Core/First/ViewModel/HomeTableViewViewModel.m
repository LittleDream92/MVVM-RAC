//
//  HomeTableViewViewModel.m
//  MVVM-RAC-1
//
//  Created by Meng Fan on 17/2/21.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "HomeTableViewViewModel.h"

@implementation HomeTableViewViewModel

-(RACSubject *)cellClickSubject {
    
    if (!_cellClickSubject) {
    
        _cellClickSubject = [RACSubject subject];
    
    }
    
    return _cellClickSubject;
}


-(RACCommand *)cellClickCommond {
    
    if (_cellClickCommond) {
        
        _cellClickCommond = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   
                    [subscriber sendNext:@"change"];
                    [subscriber sendCompleted];
                });
                
                return nil;
            }];
        }];
        
    }
    
    return _cellClickCommond;
}


@end
