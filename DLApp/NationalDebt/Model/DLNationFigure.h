//
//  DLNationFigure.h
//  SUES
//
//  Created by 李旭 on 2018/5/9.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DLNationFigure : NSObject

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *detail;

+ (NSArray *) FiguresWithArray:(NSArray *) datas;

@end
