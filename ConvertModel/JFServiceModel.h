//
//  JFServiceModel.h
//  ConvertModel
//
//  Created by JunfengLi on 16/6/10.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JFServiceModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subTitle;
@property (nonatomic, strong) NSNumber *count;
@property (nonatomic) BOOL isEdited;

@end
