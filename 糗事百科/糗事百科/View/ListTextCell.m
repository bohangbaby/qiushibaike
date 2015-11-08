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
    if (_icon == nil) {
        _icon = [UIImageView new];
        _icon.layer.cornerRadius = 20;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

- (UILabel *)nikeName {
    if (_nikeName == nil) {
        _nikeName = [UILabel new];
        _nikeName.font = [UIFont systemFontOfSize:18];
        _nikeName.textColor = kRGBColor(20, 20, 20);
    }
    return _nikeName;
}

- (UILabel *)content {
    if (_content == nil) {
        _content = [UILabel new];
        _content.font = [UIFont systemFontOfSize:16];
        _content.textColor = kRGBColor(50, 50, 50);
        _content.numberOfLines = 0;
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
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [self.nikeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_right).mas_equalTo(10);
            make.topMargin.mas_equalTo(_icon.mas_topMargin).mas_equalTo(10);
            make.right.mas_equalTo(self.type.mas_left).mas_equalTo(-10);
        }];
        [self.type mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(60, 50));
            make.top.mas_equalTo(13);
        }];
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_icon.mas_bottom).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
        [self.votes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.content.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(200);
        }];
        [self.up mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_votes.mas_bottom).mas_equalTo(5);
            make.size.mas_equalTo(CGSizeMake(60, 40));
        }];
        [self.down mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.up.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(_votes.mas_bottom).mas_equalTo(5);
        }];
        [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.down.mas_right).mas_equalTo(0);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(_votes.mas_bottom).mas_equalTo(5);
        }];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(_votes.mas_bottom).mas_equalTo(5);
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
