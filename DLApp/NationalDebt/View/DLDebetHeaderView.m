//
//  DLDebetHeaderView.m
//  SUES
//
//  Created by 李旭 on 2018/5/10.
//  Copyright © 2018年 lixu. All rights reserved.
//

#import "DLDebetHeaderView.h"
#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface DLDebetHeaderView ()

@property (nonatomic ,strong) UIImageView *imageView;

@property (nonatomic ,strong) UILabel *debetLabel;

@property (nonatomic ,strong) UILabel *sourceLabel;

@property (nonatomic ,strong) UILabel *titleLabel;

@end

@implementation DLDebetHeaderView

- (instancetype) init
{
    self = [super init];
    
    if (self) {
        [self p_setUp];
        [self setNeedsUpdateConstraints];
    }
    
    return self;
}

- (void) p_setUp
{
    [self addSubview:self.imageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.debetLabel];
    [self addSubview:self.sourceLabel];
}

- (void) updateConstraints
{
    [super updateConstraints];
    
    [self.imageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(65));
        make.width.equalTo(@(65));
        make.top.equalTo(self.mas_top).offset(30);
        make.centerX.equalTo(self.mas_centerX);
    }];
    
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.left.equalTo(self.mas_left).offset(5);
        make.right.equalTo(self.mas_right).offset(-5);
        make.top.equalTo(self.imageView.mas_bottom).offset(30);
    }];
    
    [self.debetLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(40));
        make.left.equalTo(self.mas_left).offset(20);
        make.right.equalTo(self.mas_right).offset(-20);
        make.top.equalTo(self.titleLabel.mas_bottom);
    }];
    
    [self.sourceLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}

- (void) setModel:(DLDebetHeaderModel *)model
{
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:self.model.flagURL]];
    
    NSString *debet = model.debet ?: @"0";
    self.debetLabel.text = [NSString stringWithFormat:@"$:%@",debet];
    self.sourceLabel.text = model.source;
    
    NSString *name = model.name;
    self.titleLabel.text = [NSString stringWithFormat:@"National Debt of %@",[name capitalizedString]];
}

- (UILabel *) titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:12.5];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _titleLabel;
}

- (UILabel *) debetLabel
{
    if (!_debetLabel) {
        _debetLabel = [UILabel new];
        _debetLabel.textColor = [UIColor whiteColor];
        _debetLabel.font = [UIFont systemFontOfSize:30];
        _debetLabel.textAlignment = NSTextAlignmentCenter;
    }
    
    return _debetLabel;
}

- (UILabel *) sourceLabel
{
    if (!_sourceLabel) {
        _sourceLabel = [UILabel new];
        _sourceLabel.textColor = [UIColor whiteColor];
        _sourceLabel.font = [UIFont systemFontOfSize:10];
        _sourceLabel.textAlignment = NSTextAlignmentCenter;
        _sourceLabel.numberOfLines = 0;
    }
    
    return _sourceLabel;
}

- (UIImageView *) imageView
{
    if (!_imageView) {
        _imageView = [UIImageView new];
    }
    
    return _imageView;
}

@end
