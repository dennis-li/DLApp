//
//  DebetContainerScrollView.m
//  SUES
//
//  Created by 李旭 on 2018/5/12.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "DebetContainerScrollView.h"

@implementation DebetContainerScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    BOOL isInside = [super pointInside:point withEvent:event];
    [self.touchDelegate touchPoint:point];
    return isInside;
}

@end
