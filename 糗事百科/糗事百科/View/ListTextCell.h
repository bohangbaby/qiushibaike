//
//  ListTextCell.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListTextCell : UITableViewCell

/** 用户头像 */
@property (strong, nonatomic) UIImageView *icon;
/** 用户昵称 */
@property (strong, nonatomic) UILabel *nikeName;
/** 糗事类型：新鲜、正常、最火 */
@property (strong, nonatomic) UIButton *type;
/** 糗事文字内容 */
@property (strong, nonatomic) UILabel *content;
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
