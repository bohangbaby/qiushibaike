//
//  ListTextCell.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "ListTextCell.h"
#import <AVKit/AVKit.h>
#import <AVFoundation/AVFoundation.h>

@implementation ListTextCell

#pragma mark - 懒加载

/**
 *  头部
 */
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

- (UIButton *)type {
    if (_type == nil) {
        _type = [UIButton new];
        [_type setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_type setTitleEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 0)];
        _type.titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _type;
}

- (UIButton *)userInfo {
    if (_userInfo == nil) {
        _userInfo = [UIButton new];
        _userInfo.backgroundColor = [UIColor clearColor];
    }
    return _userInfo;
}


/**
 *  中部
 */
- (UILabel *)content {
    if (_content == nil) {
        _content = [UILabel new];
        _content.font = [UIFont systemFontOfSize:16];
        _content.textColor = kRGBColor(50, 50, 50);
        _content.numberOfLines = 0;
    }
    return _content;
}

- (UIImageView *)contentImg {
    if (_contentImg == nil) {
        _contentImg = [UIImageView new];
        _contentImg.backgroundColor = [UIColor yellowColor];
    }
    return _contentImg;
}

- (UIImageView *)videoImg {
    if (_videoImg == 0) {
        _videoImg = [UIImageView new];
        _videoImg.backgroundColor = [UIColor lightGrayColor];
    }
    return _videoImg;
}

- (UIButton *)playVideo {
    if (_playVideo == nil) {
        _playVideo = [UIButton new];
        [_playVideo setImage:[UIImage imageNamed:@"multimedia_videocard_play"] forState:UIControlStateNormal];
        [_playVideo addTarget:self action:@selector(playButton) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playVideo;
}


/**
 *  底部
 */
- (UIView *)footerView {
    if (_footerView == nil) {
        _footerView = [UIView new];
    }
    return _footerView;
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
        [_up bk_addEventHandler:^(id sender) {
            _up.selected = YES;
            _down.selected = NO;
        } forControlEvents:UIControlEventTouchUpInside];
    }
    return _up;
}

- (UIButton *)down {
    if (_down == nil) {
        _down = [UIButton new];
        [_down setImage:[UIImage imageNamed:@"icon_against"] forState:UIControlStateNormal];
        [_down setImage:[UIImage imageNamed:@"icon_against_active"] forState:UIControlStateSelected];
        [_down bk_addEventHandler:^(id sender) {
            _down.selected = YES;
            _up.selected = NO;
        } forControlEvents:UIControlEventTouchUpInside];
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

#pragma merk - 添加布局
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        // 头部
        [self.contentView addSubview:self.icon];
        [self.contentView addSubview:self.nikeName];
        [self.contentView addSubview:self.type];
        [self.contentView addSubview:self.userInfo];
        
        // 中部
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.contentImg];
        [self.contentView addSubview:self.videoImg];
        [self.contentView addSubview:self.playVideo];
        
        // 底部
        [self.contentView addSubview:self.footerView];
        [self.footerView addSubview:self.up];
        [self.footerView addSubview:self.down];
        [self.footerView addSubview:self.share];
        [self.footerView addSubview:self.comment];
        [self.footerView addSubview:self.votes];
        
        /**
         *  头部控件的布局
         */
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
            make.size.mas_equalTo(CGSizeMake(60, 40));
            make.top.mas_equalTo(10);
        }];
        [self.userInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(60);
        }];
        
        /**
         *  中部控件的布局
         */
        [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.top.mas_equalTo(_userInfo.mas_bottom).mas_equalTo(0);
            make.right.mas_equalTo(-10);
        }];
        [self.contentImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_content.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(0);
        }];
        [self.videoImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_contentImg.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(0);
        }];
        [self.playVideo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(_videoImg);
        }];
        
        /**
         *  底部控件的布局
         */
        [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(_videoImg.mas_bottom).mas_equalTo(10);
            make.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(60);
        }];
        
        [self.votes mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(0);
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(kWindowW);
        }];
        [self.up mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.size.mas_equalTo(CGSizeMake(40, 40));
        }];
        [self.down mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.up.mas_right).mas_equalTo(20);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(20);
        }];
        [self.comment mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.down.mas_right).mas_equalTo(20);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(20);
        }];
        [self.share mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.size.mas_equalTo(self.up);
            make.top.mas_equalTo(20);
        }];
        
        
        
        
    }
    
    return self;
}


#pragma mark - 视频播放
//为了保证同一时间只有一个播放器，使用单例模式
+ (AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
}

//按钮点击
- (void)playButton {
    AVPlayer *player=[AVPlayer playerWithURL:self.videoURL];
    [player play];
    [ListTextCell sharedInstance].player = player;
    [self.playVideo addSubview:[ListTextCell sharedInstance].view];
    [[ListTextCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}
//如果cell被复用了，需要把cell上的播放器删掉
- (void)prepareForReuse{
    [super prepareForReuse];
    //判断当前cell是否有播放，如果有则删除-->自己想办法
    if ([ListTextCell sharedInstance].view.superview == self.playVideo) {
        [[ListTextCell sharedInstance].view removeFromSuperview];
        [ListTextCell sharedInstance].player = nil;
    }
}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
