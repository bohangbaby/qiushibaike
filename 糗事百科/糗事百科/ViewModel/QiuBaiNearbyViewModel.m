//
//  QiuBaiNearbyViewModel.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiNearbyViewModel.h"
#import "QiuBaiNetworkManager.h"
#import "QiuBaiNearByModel.h"

@implementation QiuBaiNearbyViewModel
#pragma mark - 懒加载


/** 用户头像 */
- (NSURL *)iconURLForRow:(NSInteger)row {
    NSString *path = @"http://pic.qiushibaike.com/system/avtnew/";
    NSString *createId = [NSString stringWithFormat:@"%ld",[self userModelForRow:row].ID];
    NSString *iconStr = @"";
    if (createId.length >= 4) {
        NSString *leadId = [createId substringWithRange:NSMakeRange(0, 4)];
        iconStr = [NSString stringWithFormat:@"%@/%@/%@/medium/%@",path,leadId,createId,[self userModelForRow:row].icon];
    }
    
    NSURL *url = [NSURL URLWithString:iconStr];
    return url;
}

/** 用户昵称 */
- (NSString *)nikeNameForRow:(NSInteger)row {
    
    return [self userModelForRow:row].login;
}

/** 用户性别 */
- (NSString *)genderForRow:(NSInteger)row {
    return [self userModelForRow:row].gender;
}

/** 用户年龄 */
- (NSString *)ageForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld",[self userModelForRow:row].age];
}

/** 糗事创建时间 */
- (NSString *)createTimeForRow:(NSInteger)row {
    NSInteger createTime = [self nearbyModelForRow:row].created_at;
    NSInteger currentTime = [[NSDate date] timeIntervalSince1970];
    NSInteger hToS = 60*60;     // 一小时秒数
    NSInteger dToS = 60*60*24;  // 一天秒数
    NSString *time = @"";
    NSInteger awayTime = currentTime - createTime;
    if (awayTime > 60 && awayTime < hToS) {
        time = [NSString stringWithFormat:@"%ld分钟前",awayTime/60];
    }else if (awayTime > hToS && awayTime < dToS) {
        time = [NSString stringWithFormat:@"%ld小时前",awayTime/hToS];
    }else if (awayTime > dToS) {
        time = [NSString stringWithFormat:@"%ld天前",awayTime/dToS];
    }
    return time;
}

/** 糗事文字内容 */
- (NSString *)contentForRow:(NSInteger)row {
    NSString *content = [self nearbyModelForRow:row].content;
    // 假如是转发的内容，对内容进行解析
    if ([content rangeOfString:@"qiushi_content"].location != NSNotFound) {
        NSData *data = [content dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSDictionary *contentDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        NSString *circleContent = contentDic[@"circle_content"];
        NSString *qiushiContent = contentDic[@"qiushi_content"];
        NSLog(@"%@---%@",circleContent,qiushiContent);
        return [NSString stringWithFormat:@"%@\n%@",circleContent,qiushiContent];
    }else
        return [self nearbyModelForRow:row].content;
}

/** 糗事图片组 */
- (NSArray *)contentImgForRow:(NSInteger)row {
    NSArray *picArr = [self nearbyModelForRow:row].pic_urls;
    NSMutableArray *picMArr = [NSMutableArray array];
    NSInteger count = picArr.count;
    for (int i = 0; i < count; i++) {
        DataPicUrlsModel *picModel = picArr[i];
        NSURL *url = [NSURL URLWithString:picModel.pic_url];
        [picMArr addObject:url];
    }
    return [picMArr copy];
}

/** 图片的数量 */
- (NSInteger)imgCountForRow:(NSInteger)row {
    return [self contentImgForRow:row].count;
}

/** 是否有投票 */
- (BOOL)isVotesForRow:(NSInteger)row {
    return [self nearbyModelForRow:row].vote.option_a;
}

/** 投票的内容 */
- (NSArray *)voteContentForRow:(NSInteger)row {
    NSString *optionA = [self nearbyModelForRow:row].vote.option_a;
    NSString *optionB = [self nearbyModelForRow:row].vote.option_b;
    return @[optionA,optionB];
}

/** 投票的结果 */
- (NSArray *)voteResultForRow:(NSInteger)row {
    NSString *oaCount = [NSString stringWithFormat:@"%@ %ld",[self nearbyModelForRow:row].vote.option_a,[self nearbyModelForRow:row].vote.oa_count];
    NSString *obCount = [NSString stringWithFormat:@"%@ %ld",[self nearbyModelForRow:row].vote.option_b,[self nearbyModelForRow:row].vote.ob_count];
    return @[oaCount,obCount];
}

/** 位置信息 */
- (NSString *)locationForRow:(NSInteger)row {
    return [self nearbyModelForRow:row].loaction;
}

/** 点赞的人数 */
- (NSString *)likeCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld",[self nearbyModelForRow:row].like_count];
}

/** 评论的人数 */
- (NSString *)commentCountForRow:(NSInteger)row {
    return [NSString stringWithFormat:@"%ld",[self nearbyModelForRow:row].comment_count];
}



/**
 *  获取数据
 */

- (NearbyDataModel *)nearbyModelForRow:(NSInteger)row {
    return self.dataArr[row];
}

- (DataVoteModel *)voteModelForRow:(NSInteger)row {
    return [self nearbyModelForRow:row].vote;
}

- (DataUserModel *)userModelForRow:(NSInteger)row {
    return [self nearbyModelForRow:row].user;
}


- (void)getDataComletionHandle:(void(^)(NSError *error))completionHandle {
    [QiuBaiNetworkManager getNearbyModelWithPage:self.page latitude:_latitude longitude:_longitude completionHandle:^(QiuBaiNearByModel *model, NSError *error) {
        completionHandle(error);
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        self.rowNumber = self.dataArr.count;
    }];
}

- (void)refreshDataComletionHandle:(void (^)(NSError *))completionHandle {
    self.page = 1;
    self.latitude = 1;
    self.longitude = 1;
    [self getDataComletionHandle:completionHandle];
}

- (void)getMoreDataComletionHandle:(void (^)(NSError *))completionHandle {
    self.page++;
    [self getDataComletionHandle:completionHandle];
}

@end
