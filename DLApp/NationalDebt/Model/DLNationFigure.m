//
//  DLNationFigure.m
//  SUES
//
//  Created by 李旭 on 2018/5/9.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "DLNationFigure.h"

@implementation DLNationFigure

+ (NSArray *) FiguresWithArray:(NSArray *) datas
{
    if (![datas isKindOfClass:[NSArray class]]) {
        return nil;
    }
    NSMutableArray *dataSource = [NSMutableArray array];
    
    //提取主要经济数据
    DLNationFigure *figure = nil;
    for (NSInteger i = 0; i < datas.count; i++) {
        
        NSString *obj = datas[i];
        if (![obj isKindOfClass:[NSString class]]) {
            return nil;
        }
        
        if ([obj isEqualToString:@""]) {
            continue;
        }
        
        if (i % 2 == 0) {   //数据名称
            figure = [DLNationFigure new];
            [dataSource addObject:figure];
            figure.title = obj;
        } else {            //具体数据
            figure.detail = obj;
        }
        
    }
    
    return [dataSource copy];
}

@end
