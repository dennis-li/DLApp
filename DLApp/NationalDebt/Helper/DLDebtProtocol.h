//
//  DLDebtProtocol.h
//  SUES
//
//  Created by 李旭 on 2018/5/11.
//  Copyright © 2018年 lixu. All rights reserved.
//

#ifndef DLDebtProtocol_h
#define DLDebtProtocol_h

@protocol DebetContainerViewControllerDelegate <NSObject>

- (void) containerViewScrollViewWillBeginDragging:(UIScrollView *)scrollView;

- (void) containerViewScrollViewDidScroll:(UIScrollView *)scrollView;

- (void) containerViewDidEndDecelerating:(UIScrollView *)scrollView;

@end

@protocol DebetContainerScrollViewTouchDelegate <NSObject>

- (void) touchPoint:(CGPoint) point;

@end

#endif /* DLDebtProtocol_h */
