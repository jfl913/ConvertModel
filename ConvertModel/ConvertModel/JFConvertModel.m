//
//  JFConvertModel.m
//  ConvertModel
//
//  Created by JunfengLi on 16/6/26.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "JFConvertModel.h"
#import "NSObject+Properties.h"

@implementation JFConvertModel

+ (void)convertSourceModel:(id)sourceModel
           toTargetModel:(id)targetModel
{
    NSSet *serviceProperties = [[sourceModel class] propertyKeys];
    
    NSSet *viewProperties = [[targetModel class] propertyKeys];
    
    [viewProperties enumerateObjectsUsingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *key = obj;
        
        BOOL exist = [serviceProperties containsObject:key];
        if (exist) {
            id value = [sourceModel valueForKey:key];
            [targetModel setValue:value forKey:key];
        }
    }];
}

@end
