//
//  DebtModel.m
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "DebtModel.h"
#import "DebtDefines.h"

@implementation DebtModel

+ (instancetype) modelWithDictionary:(NSDictionary *) dict
{
    DebtModel *model = [DebtModel new];
    
    if ([dict isKindOfClass:[NSDictionary class]]) {
        model.name = dict[kDLCountryName];
        model.GDP = dict[kDLCountryGDP];
        model.population = dict[kDLCountryPopulation];
        model.href = dict[kDLCountryHref];
        model.nationalFlag = dict[kDLNationalFlag];
        model.fullName = dict[kDLCountryFullName];
    }
    
    return model;
}

+ (NSArray *) modelsWithArray:(NSArray *)array
{
    NSMutableArray *models = [NSMutableArray array];
    if (![array isKindOfClass:[NSArray class]]) {
        return [models copy];
    }
    
    for (NSDictionary *dict in array) {
        if (![dict isKindOfClass:[NSDictionary class]]) {
            return [models copy];
        }
        
        DebtModel *model = [self modelWithDictionary:dict];
        [models addObject:model];
    }
    
    return [models copy];
    
}

@end
