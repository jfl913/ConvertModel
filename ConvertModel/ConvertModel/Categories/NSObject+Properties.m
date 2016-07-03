//
//  NSObject+Properties.m
//  ConvertModel
//
//  Created by JunfengLi on 16/6/10.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "NSObject+Properties.h"
#import <objc/runtime.h>

@implementation NSObject (Properties)

+ (NSSet *)propertyKeys
{
    NSMutableSet *keys = [NSMutableSet set];
    
    [self enumeratePropertiesUsingBlock:^(objc_property_t property, BOOL *stop) {
        NSString *key = @(property_getName(property));
        [keys addObject:key];
    }];
    
    return keys;
}

+ (void)enumeratePropertiesUsingBlock:(void (^)(objc_property_t property, BOOL *stop))block
{
    Class cls = self;
    BOOL stop = NO;
    
    while (!stop && ![cls isEqual:NSObject.class]) {
        unsigned count = 0;
        objc_property_t *properties = class_copyPropertyList(cls, &count);
        
        cls = cls.superclass;
        if (properties == NULL) continue;
        
        for (unsigned i = 0; i < count; i++) {
            block(properties[i], &stop);
            if (stop) {
                break;
            }
        }
    }
}

+ (void)printAllPropertiesAndValues
{
    unsigned int outCount, i;
    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
    for (i = 0; i < outCount; i++) {
        objc_property_t property = properties[i];
        const char *propertyName = property_getName(property);
        const char *propertyAttribute = property_getAttributes(property);
        NSLog(@"propertyName: %@", @(propertyName));
        NSLog(@"propertyAttribute: %@", @(propertyAttribute));
        NSLog(@"----------------");
    }
    free(properties);
}

@end
