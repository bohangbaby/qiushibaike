//
//  ListTextCell.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "ListTextCell.h"

@implementation ListTextCell

#pragma mark - 懒加载
- (UIImageView *)icon {
    if (_icon) {
        _icon = [UIImageView new];
        _icon.layer.cornerRadius = _icon.width/2.0;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

- (UILabel *)nikeName {
    if (_nikeName == nil) {
        _nikeName = [UILabel new];
        _nikeName.font = [UIFont systemFontOfSize:18];
        _nikeName.textColor = [UIColor grayColor];
    }
    return _nikeName;
}

- (UILabel *)content {
    if (_content == nil) {
        _content = [UILabel new];
        _nikeName.font = [UIFont systemFontOfSize:18];
    }
    return _content;
}

- (UIButton *)type {
    if (_type == nil) {
        _type = [UIButton new];
    }
    return _type;
}

- (UILabel *)votes {
    if (_votes == nil) {
        _votes = [UILabel new];
        _votes.textColor = [UIColor grayColor];
        _votes.font = [UIFont systemFontOfSize:14];
    }
    return _votes;
}

- (UIButton *)up {
    if (_up == nil) {
        _up = [UIButton new];
        [_up setImage:[UIImage imageNamed:@"icon_for"] forState:UIControlStateNormal];
        [_up setImage:[UIImage imageNamed:@"icon_for_active"] forState:UIControlStateSelected];
    }
    return _up;
}

- (UIButton *)down {
    if (_down == nil) {
        _down = [UIButton new];
        [_down setImage:[UIImage imageNamed:@"icon_against"] forState:UIControlStateNormal];
        [_down setImage:[UIImage imageNamed:@"icon_against_active"] forState:UIControlStateSelected];
    }
    return _down;
}

- (UIButton *)comment {
    if (_comment == nil) {
        _comment = [UIButton new];
        [_comment setImage:[UIImage imageNamed:@"button_comment"] forState:UIControlStateNormal];
    }
    return _comment;
}

- (UIButton *)share {
    if (_share == nil) {
        _share = [UIButton new];
        [_share setImage:[UIImage imageNamed:@"icon_fav"] forState:UIControlStateNormal];
    }
    return _share;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.up];
        [self.contentView addSubview:self.down];
        [self.contentView addSubview:self.share];
        [self.contentView addSubview:self.comment];
        [self.contentView addSubview:self.nikeName];
        [self.contentView addSubview:self.type];
        [self.contentView addSubview:self.votes];
        [self.contentView addSubview:self.content];
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(50, 50));
        }];
        [self.nikeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(_icon.mas_topMargin).mas_equalTo(3);
            make.right.mas_equalTo(_type.mas_left).mas_equalTo(-10);
        }];
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(60, 50));
            make.topMargin.mas_equalTo(_nikeName.mas_topMargin);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_icon.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.votes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_content.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.width.mas_equalTo(200);
        }];
        [self.up mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_votes.mas_bottom).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(60, 40));
        }];
        [self.down mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_up.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(_up);
            make.topMargin.mas_equalTo(_up.mas_topMargin);
        }];
        [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_down.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(_up);
            make.topMargin.mas_equalTo(_up.mas_topMargin);
        }];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(_up);
            make.topMargin.mas_equalTo(_up.mas_topMargin);
        }];
        
        
        
        
    }
    
    return self;
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
