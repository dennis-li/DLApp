//
//  DebtTableViewCell.h
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DebtModel.h"

@interface DebtTableViewCell : UITableViewCell

@property (nonatomic ,weak) DebtModel *model;

@property (nonatomic ,strong) UIView *containerView;

@end
