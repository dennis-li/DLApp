//
//  UIView+Frame.h
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// Position
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
// Size
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
- (void)setWidthFromRight:(CGFloat)width;
- (void)setHeightFromBottom:(CGFloat)height;
- (void)setWidthFromCenter:(CGFloat)width;
- (void)setHeightFromCenter:(CGFloat)height;
@end
