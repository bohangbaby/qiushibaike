//
//  ListTextCell.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTextCell : UITableViewCell

/**
 *  代码重构，分三个部分：头部用户信息栏、中间糗事内容、底部评论区.
 */

/** 头部 */
@property (strong, nonatomic) UIButton *userInfo;
/** 用户头像 */
@property (strong, nonatomic) UIImageView *icon;
/** 用户昵称 */
@property (strong, nonatomic) UILabel *nikeName;
/** 糗事类型：新鲜、正常、最火 */
@property (strong, nonatomic) UIButton *type;


/** 中部 */
/** 糗事文字内容 */
@property (strong, nonatomic) UILabel *content;
/** 糗事图片内容 */
@property (strong, nonatomic) UIImageView *contentImg;
/** 糗事视频内容 */
@property (strong, nonatomic) UIImageView *videoImg;
/** 视频点击按钮 */
@property (strong, nonatomic) UIButton *playVideo;
/** 视频地址 */
@property (strong, nonatomic) NSURL *videoURL;

/** 底部 */

@property (strong, nonatomic) UIView *footerView;
/** 好笑、评论数 */
@property (strong, nonatomic) UILabel *votes;
/** 点赞按钮 */
@property (strong, nonatomic) UIButton *up;
/** 踩低按钮 */
@property (strong, nonatomic) UIButton *down;
/** 评论按钮 */
@property (strong, nonatomic) UIButton *comment;
/** 转发分享按钮 */
@property (strong, nonatomic) UIButton *share;



@end
