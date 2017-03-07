//
//  NMFAddress.m
//  MVVM-RAC-2
//
//  Created by Meng Fan on 17/3/7.
//  Copyright © 2017年 Meng Fan. All rights reserved.
//

#import "NMFAddress.h"

@implementation NMFAddress

-(void)setValue:(id)value forKey:(NSString *)key {
    NSLog(@"address不能识别key： %@", key);
}


-(NSString *)description {
    return [NSString stringWithFormat:@"name = %@, address = %@, phone = %@", self.n_name, self.n_address, self.n_phone];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    unsigned int count = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        
        objc_property_t pro = propertyList[i];
       const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        if ([aDecoder decodeObjectForKey:key]) {
            [self setValue:[aDecoder decodeObjectForKey:key] forKey:key];
        }
    }
    return self;
}


// <NScoding>
- (void)encodeWithCoder:(NSCoder *)aCoder {
    
    unsigned int count = 0;
    
    objc_property_t *propertyList = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t pro = propertyList[i];
        const char *name = property_getName(pro);
        NSString *key = [NSString stringWithUTF8String:name];
        [aCoder encodeObject:[self valueForKey:key] forKey:key];
    }
}


@end
