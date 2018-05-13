//
//  DebetContainerScrollView.h
//  SUES
//
//  Created by 李旭 on 2018/5/12.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DLDebtProtocol.h"


@interface DebetContainerScrollView : UIScrollView

@property (nonatomic ,weak) id<DebetContainerScrollViewTouchDelegate> touchDelegate;

@end
