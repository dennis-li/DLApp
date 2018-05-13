//
//  DebtModel.h
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DebtModel : NSObject

@property (nonatomic ,copy) NSString *name;

@property (nonatomic ,copy) NSString *fullName;

@property (nonatomic ,copy) NSString *GDP;

@property (nonatomic ,copy) NSString *population;

@property (nonatomic ,copy) NSString *href;

@property (nonatomic ,copy) NSString *nationalFlag;

+ (instancetype) modelWithDictionary:(NSDictionary *) dict;

+ (NSArray *) modelsWithArray:(NSArray *) array;

@end
