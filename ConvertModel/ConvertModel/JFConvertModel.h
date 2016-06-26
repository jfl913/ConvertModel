//
//  JFConvertModel.h
//  ConvertModel
//
//  Created by JunfengLi on 16/6/26.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFConvertModel : NSObject

+ (void)convertSourceModel:(NSObject *)sourceModel
           toTargetModel:(NSObject *)targetModel;

@end
