//
//  ViewController.m
//  ConvertModel
//
//  Created by JunfengLi on 16/6/10.
//  Copyright © 2016年 JunfengLi. All rights reserved.
//

#import "ViewController.h"
#import "JFServiceModel.h"
#import "JFViewModel.h"
#import "NSObject+Properties.h"
#import "JFConvertModel.h"

@interface ViewController ()

@property (nonatomic, strong) JFServiceModel *serviceModel;
@property (nonatomic, strong) JFViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self serviceModel];
    
    
}

- (IBAction)convertModel:(id)sender
{
//    [JFConvertModel convertSourceModel:self.serviceModel
//                         toTargetModel:self.viewModel];
    [JFServiceModel printAllPropertiesAndValues];
}

#pragma mark - Accessors

- (JFServiceModel *)serviceModel
{
    if (!_serviceModel) {
        _serviceModel = [JFServiceModel new];
        _serviceModel.title = @"诛仙";
        _serviceModel.subTitle = @"玄幻小说";
        _serviceModel.count = @6;
        _serviceModel.isEdited = YES;
    }
    
    return _serviceModel;
}

- (JFViewModel *)viewModel
{
    if (!_viewModel) {
        _viewModel = [JFViewModel new];
    }
    
    return _viewModel;
}

@end
