//
//  QiuBaiNearbyViewModel.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseViewModel.h"

@interface QiuBaiNearbyViewModel : BaseViewModel

/**
 *  行数
 */
@property (nonatomic) NSInteger rowNumber;
/**
 *  存储当前数据
 */
@property (strong, nonatomic) NSMutableArray *dataArr;

@property (nonatomic) NSInteger latitude;
@property (nonatomic) NSInteger longitude;

/** 用户头像 */
- (NSURL *)iconURLForRow:(NSInteger)row;

/** 用户昵称 */
- (NSString *)nikeNameForRow:(NSInteger)row;

/** 用户性别 */
- (NSString *)genderForRow:(NSInteger)row;

/** 用户年龄 */
- (NSString *)ageForRow:(NSInteger)row;

/** 糗事创建时间 */
- (NSString *)createTimeForRow:(NSInteger)row;

/** 糗事文字内容 */
- (NSString *)contentForRow:(NSInteger)row;

/** 糗事图片组 */
- (NSArray *)contentImgForRow:(NSInteger)row;
/** 图片的数量 */
- (NSInteger)imgCountForRow:(NSInteger)row;
/** 是否有投票 */
- (BOOL)isVotesForRow:(NSInteger)row;

/** 投票的内容 */
- (NSArray *)voteContentForRow:(NSInteger)row;

/** 投票的结果 */
- (NSArray *)voteResultForRow:(NSInteger)row;

/** 位置信息 */
- (NSString *)locationForRow:(NSInteger)row;

/** 点赞的人数 */
- (NSString *)likeCountForRow:(NSInteger)row;

/** 评论的人数 */
- (NSString *)commentCountForRow:(NSInteger)row;



@end
