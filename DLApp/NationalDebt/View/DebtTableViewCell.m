//
//  DebtTableViewCell.m
//  SUES
//
//  Created by 李旭 on 2018/4/28.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "DebtTableViewCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

static NSInteger topMargin() {
    return 5;
}

static NSInteger leftMargin() {
    return 5;
}

static NSInteger bottomMargin() {
    return 5;
}

static NSInteger rightMargin() {
    return 5;
}

@interface DebtTableViewCell ()

@property (nonatomic ,strong) UIView *shadowView;

@property (nonatomic ,strong) UILabel *nameLabel;

@property (nonatomic ,strong) UIImageView *nationalFlagView;

@property (nonatomic ,strong) UILabel *GDPLabel;

@property (nonatomic ,strong) UILabel *populationLabel;

@end

@implementation DebtTableViewCell

#pragma  mark - Life Cycle
- (instancetype) initWithStyle:(UITableViewCellStyle) style
               reuseIdentifier:(NSString *) reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self p_setUp];
        
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}


- (void) updateConstraints
{
    [super updateConstraints];
    
    CGFloat containerHeight = 80;
    CGFloat containerWidth = self.width - 20;
    CGFloat nationalFlagHeightWidth = 65;
    CGFloat nationalFlagMarginTop = (containerHeight - nationalFlagHeightWidth)/2;
    CGFloat nationalFlagMarginBottom = nationalFlagMarginTop;
    CGFloat commonMarginLeft = 15;
    CGFloat commonMarginRight = 15;
    CGFloat commonHeight = 20;

    [self.shadowView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(containerHeight));
        make.width.equalTo(@(containerWidth));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.containerView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(containerHeight));
        make.width.equalTo(@(containerWidth));
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
    }];
    
    [self.nationalFlagView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(nationalFlagHeightWidth));
        make.width.equalTo(@(nationalFlagHeightWidth));
        make.left.equalTo(self.containerView.mas_left).offset(5);
        make.centerY.equalTo(self.containerView.mas_centerY);
    }];
    
    [self.nameLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top).offset(nationalFlagMarginTop);
        make.left.equalTo(self.nationalFlagView.mas_right).offset(commonMarginLeft);
        make.height.equalTo(@(commonHeight));
        make.right.equalTo(self.containerView.mas_right).offset(-commonMarginRight);
    }];
    
    [self.GDPLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.containerView.mas_centerY);
        make.left.equalTo(self.nationalFlagView.mas_right).offset(commonMarginLeft);
        make.height.equalTo(@(commonHeight));
        make.right.equalTo(self.containerView.mas_right).offset(-commonMarginRight);
    }];

    [self.populationLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-nationalFlagMarginBottom);
        make.left.equalTo(self.nationalFlagView.mas_right).offset(commonMarginLeft);
        make.height.equalTo(@(commonHeight));
        make.right.equalTo(self.containerView.mas_right).offset(-commonMarginRight);
    }];
}

#pragma  mark - Private Method
- (void) p_setUp
{
    self.width = [UIScreen mainScreen].bounds.size.width;
    
    [self addSubview:self.shadowView];
    [self addSubview:self.containerView];
    [self.containerView addSubview:self.nameLabel];
    [self.containerView addSubview:self.nationalFlagView];
    [self.containerView addSubview:self.GDPLabel];
    [self.containerView addSubview:self.populationLabel];
    
    self.shadowView.frame = CGRectMake(leftMargin(), topMargin(), self.width-(leftMargin()+rightMargin()), self.height-(topMargin()+bottomMargin()));
    self.containerView.frame = self.shadowView.frame;
    
    self.backgroundColor = [UIColor clearColor];
}

- (void) p_updateUI
{
    self.nameLabel.text = self.model.fullName;
    self.GDPLabel.text = [NSString stringWithFormat:@"GDP:%@",self.model.GDP];
    self.populationLabel.text = [NSString stringWithFormat:@"Population:%@",self.model.population];
    [self.nationalFlagView sd_setImageWithURL:[NSURL URLWithString:self.model.nationalFlag] placeholderImage:[UIImage imageNamed:@"background"] options:SDWebImageQueryDiskSync];
}

#pragma  mark - Property
- (void) setModel:(DebtModel *)model
{
    _model = model;
    [self p_updateUI];
}

- (UIView *) shadowView
{
    if (!_shadowView) {
        _shadowView = [UIView new];
        _shadowView.layer.shadowOpacity = 0.11;
        _shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
        _shadowView.layer.shadowRadius = 4;
        _shadowView.layer.shadowOffset = CGSizeMake(0, 1);
        _shadowView.layer.cornerRadius = 8;
        _shadowView.clipsToBounds = NO;
        _shadowView.backgroundColor = [UIColor whiteColor];
        
    }
    
    return _shadowView;
}

- (UIView *) containerView
{
    if (!_containerView) {
        _containerView = [UIView new];
        _containerView.layer.masksToBounds = YES;
        _containerView.layer.cornerRadius = 8;
        _containerView.backgroundColor = [UIColor blackColor];
        
    }
    
    return _containerView;
}

- (UILabel *) nameLabel
{
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.textColor = [UIColor whiteColor];
    }
    
    return _nameLabel;
    
}

- (UIImageView *) nationalFlagView
{
    if (!_nationalFlagView) {
        _nationalFlagView = [UIImageView new];
    }
    
    return _nationalFlagView;
}

- (UILabel *) GDPLabel
{
    if (!_GDPLabel) {
        _GDPLabel = [UILabel new];
        _GDPLabel.font = [UIFont systemFontOfSize:15];
        _GDPLabel.textColor = [UIColor whiteColor];
    }
    
    return _GDPLabel;
}

- (UILabel *) populationLabel
{
    if (!_populationLabel) {
        _populationLabel = [UILabel new];
        _populationLabel.font = [UIFont systemFontOfSize:15];
        _populationLabel.textColor = [UIColor whiteColor];
    }
    
    return _populationLabel;
}

@end
