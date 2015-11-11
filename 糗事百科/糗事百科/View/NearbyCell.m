//
//  NearbyCell.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "NearbyCell.h"

@implementation NearbyCell
#pragma mark - 懒加载
- (UIImageView *)icon {
    if (_icon == nil) {
        _icon = [[UIImageView alloc] init];
        _icon.layer.cornerRadius = 20;
        _icon.layer.masksToBounds = YES;
    }
    return _icon;
}

- (UILabel *)nikeName {
    if (_nikeName == nil) {
        _nikeName = [[UILabel alloc] init];
        _nikeName.font = [UIFont systemFontOfSize:16];
        _nikeName.textColor = kRGBColor(50, 50, 50);
    }
    return _nikeName;
}

- (UIButton *)ageAndGender {
    if (_ageAndGender == nil) {
        _ageAndGender = [UIButton new];
        [_ageAndGender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _ageAndGender.titleLabel.font = [UIFont systemFontOfSize:11];
        _ageAndGender.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _ageAndGender.layer.cornerRadius = 3;
    }
    return _ageAndGender;
}

- (UILabel *)createTime {
    if (_createTime == nil) {
        _createTime = [UILabel new];
        _createTime.font = [UIFont systemFontOfSize:13];
        _createTime.textColor = kRGBColor(150, 150, 150);
    }
    return _createTime;
}

- (UIButton *)more {
    if (_more == nil) {
        _more = [UIButton new];
        [_more setImage:[UIImage imageNamed:@"qbf_arrow"] forState:UIControlStateNormal];
    }
    return _more;
}

- (UILabel *)contentText {
    if (_contentText == nil) {
        _contentText = [UILabel new];
        _contentText.numberOfLines = 0;
    }
    return _contentText;
}

- (UIView *)allImageView {
    if (_allImageView == nil) {
        _allImageView = [[UIView alloc] init];
    }
    return _allImageView;
}

- (UIButton *)optionA {
    if (_optionA == nil) {
        _optionA = [UIButton new];
        _optionA.backgroundColor = kRGBColor(247, 247, 247);
        [_optionA setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_optionA setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return _optionA;
}

- (UIButton *)optionB {
    if (_optionB == nil) {
        _optionB = [UIButton new];
        _optionB.backgroundColor = kRGBColor(247, 247, 247);
        [_optionB setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [_optionB setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    }
    return _optionB;
}

- (UIImageView *)vsImageView {
    if (_vsImageView == nil) {
        _vsImageView = [UIImageView new];
        _vsImageView.image = [UIImage imageNamed:@"qbf_vs_nor"];
        _vsImageView.layer.cornerRadius = 15;
        _vsImageView.layer.masksToBounds = YES;
    }
    return _vsImageView;
}

- (UIView *)optionView {
    if (_optionView == nil) {
        _optionView = [[UIView alloc] init];
    }
    return _optionView;
}




- (UILabel *)locationLb {
    if (_locationLb == nil) {
        _locationLb = [UILabel new];
        _locationLb.font = [UIFont systemFontOfSize:14];
        _locationLb.textColor = [UIColor grayColor];
    }
    return _locationLb;
}

- (UIButton *)likeBtn {
    if (_likeBtn == nil) {
        _likeBtn = [UIButton new];
        [_likeBtn setImage:[UIImage imageNamed:@"qbf_like"] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"qbf_like_copy"] forState:UIControlStateSelected];
        [_likeBtn setTitleColor:kRGBColor(216, 216, 216) forState:UIControlStateNormal];
    }
    return _likeBtn;
}

- (UIButton *)commentBtn {
    if (_commentBtn == nil) {
        _commentBtn = [UIButton new];
        [_commentBtn setImage:[UIImage imageNamed:@"qbf_chat"] forState:UIControlStateNormal];
        [_commentBtn setTitleColor:kRGBColor(216, 216, 216) forState:UIControlStateNormal];
    }
    return _commentBtn;
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.nikeName];
        [self.contentView addSubview:self.ageAndGender];
        [self.contentView addSubview:self.createTime];
        [self.contentView addSubview:self.headerButton];
        [self.contentView addSubview:self.more];
        
        [self.contentView addSubview:self.contentText];
        [self.contentView addSubview:self.allImageView];
        
        [self.contentView addSubview:self.optionView];
        [self.optionView addSubview:self.optionA];
        [self.optionView addSubview:self.optionB];
        [self.optionView addSubview:self.vsImageView];
        
        [self.contentView addSubview:self.locationLb];
        [self.contentView addSubview:self.likeBtn];
        [self.contentView addSubview:self.commentBtn];
        
        
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [self.nikeName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(_icon.mas_right).mas_equalTo(10);
            make.top.mas_equalTo(15);
            make.right.mas_equalTo(_ageAndGender.mas_left).mas_equalTo(-2);
            make.height.mas_equalTo(30);
            make.width.mas_lessThanOrEqualTo(150);
        }];
        [self.ageAndGender mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(35, 15));
            make.top.mas_equalTo(23);
        }];
        [self.createTime mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(60, 22));
            make.right.mas_equalTo(_more.mas_left).mas_equalTo(0);
            make.top.mas_equalTo(19);
        }];
        [self.headerButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(_more.mas_left).mas_equalTo(0);
            make.height.mas_equalTo(60);
        }];
        [self.more mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
            make.top.mas_equalTo(20);
        }];
        
        
        
        
        [self.contentText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(60);
            make.leftMargin.mas_equalTo(_nikeName.mas_leftMargin);
            make.right.mas_equalTo(-10);
            make.bottom.mas_equalTo(_allImageView.mas_top).mas_equalTo(-5);
        }];
        [self.allImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_nikeName.mas_leftMargin);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(0);
        }];
        
        
        
        [self.optionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_nikeName.mas_leftMargin);
            make.height.mas_equalTo(0);
            make.top.mas_equalTo(_allImageView.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
        [self.optionA mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.left.mas_equalTo(0);
        }];
        [self.vsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.top.mas_equalTo(0);
            make.width.mas_equalTo(30);
            make.left.mas_equalTo(_optionA.mas_right).mas_equalTo(-15);
            make.right.mas_equalTo(_optionB.mas_left).mas_equalTo(15);
        }];
        [self.optionB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(0);
            make.size.mas_equalTo(_optionA);
            make.right.mas_equalTo(-10);
        }];
        
        
        
        [self.locationLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(_nikeName.mas_leftMargin);
            make.right.mas_equalTo(_likeBtn.mas_left).mas_equalTo(-10);
            make.top.mas_equalTo(_optionView.mas_bottom).mas_equalTo(10);
            make.height.mas_equalTo(30);
            make.bottom.mas_equalTo(-10);
        }];
        [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(_locationLb.mas_topMargin);
            make.size.mas_equalTo(CGSizeMake(80, 30));
            make.right.mas_equalTo(_commentBtn.mas_left).mas_equalTo(10);
        }];
        [self.commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.topMargin.mas_equalTo(_locationLb.mas_topMargin);
            make.size.mas_equalTo(_likeBtn);
            make.right.mas_equalTo(0);
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
