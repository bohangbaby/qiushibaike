//
//  NearbyCell.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyCell : UITableViewCell

/** 用户头像 */
@property (strong, nonatomic) UIImageView *icon;
/** 用户昵称 */
@property (strong, nonatomic) UILabel *nikeName;
/** 用户年龄和性别 */
@property (strong, nonatomic) UIButton *ageAndGender;
/** 创建时间 */
@property (strong, nonatomic) UILabel *createTime;
/** 更多选择 */
@property (strong, nonatomic) UIButton *more;
/** 覆盖在上面的按钮 */
@property (strong, nonatomic) UIButton *headerButton;


/** 糗事内容 */
@property (strong, nonatomic) UILabel *contentText;
/** 糗事图片内容 */
@property (strong, nonatomic) UIView *allImageView;


/** 投票内容1 */
@property (strong, nonatomic) UIButton *optionA;
/** 投票内容2 */
@property (strong, nonatomic) UIButton *optionB;
/** 中间的VS图片 */
@property (strong, nonatomic) UIImageView *vsImageView;
/** 容器 */
@property (strong, nonatomic) UIView *optionView;


/** 位置信息 */
@property (strong, nonatomic) UILabel *locationLb;
/** 点赞按钮 */
@property (strong, nonatomic) UIButton *likeBtn;
/** 评论 */
@property (strong, nonatomic) UIButton *commentBtn;


@end
