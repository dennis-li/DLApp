//
//  UIView+Frame.m
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)
- (CGFloat)top {
    return CGRectGetMinY(self.frame);
}
- (void)setTop:(CGFloat)top {
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)left {
    return CGRectGetMinX(self.frame);
}
- (void)setLeft:(CGFloat)left {
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)bottom {
    return CGRectGetMaxY(self.frame);
}
- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.height;
    self.frame = frame;
}

- (CGFloat)right {
    return CGRectGetMaxX(self.frame);
}
- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - self.width;
    self.frame = frame;
}

- (CGFloat)width {
    return CGRectGetWidth(self.frame);
}
- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return CGRectGetHeight(self.frame);
}
- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWidthFromRight:(CGFloat)width {
    CGRect frame = self.frame;
    frame.origin.x = self.right - width;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeightFromBottom:(CGFloat)height {
    CGRect frame = self.frame;
    frame.origin.y = self.bottom - height;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setWidthFromCenter:(CGFloat)width {
    CGRect frame = self.frame;
    frame.origin.x = self.center.x - (width / 2.0f);
    frame.size.width = width;
    self.frame = frame;
}

- (void)setHeightFromCenter:(CGFloat)height {
    CGRect frame = self.frame;
    frame.origin.y = self.center.y - (height / 2.0f);
    frame.size.height = height;
    self.frame = frame;
}
@end
