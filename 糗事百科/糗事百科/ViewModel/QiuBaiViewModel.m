//
//  QiuBaiViewModel.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiViewModel.h"

@implementation QiuBaiViewModel
#pragma mark - 懒加载

/**
 *  获取糗事模型
 */
- (QiuBaiItemsModel *)itemsModelForRow:(NSInteger)row {
    return self.dataArr[row];
}
/**
 *  获取用户模型
 */
- (ItemsUserModel *)userModelForRow:(NSInteger)row {
    return [self itemsModelForRow:row].user;
}

/**
 *  获取用户糗事的支持
 */
- (ItemsVotesModel *)votesModelForRow:(NSInteger)row {
    return [self itemsModelForRow:row].votes;
}
/**
 *  用户头像
 */
- (NSURL *)iconForRow:(NSInteger)row {
    NSString *path = @"http://pic.qiushibaike.com/system/avtnew/";
    NSString *createId = [NSString stringWithFormat:@"%ld",[self userModelForRow:row].ID];
    NSString *iconStr = @"";
    if (![createId isEqualToString:@"0"]) {
        NSString *leadId = [createId substringWithRange:NSMakeRange(0, 4)];
        iconStr = [NSString stringWithFormat:@"%@/%@/%@/medium/%@",path,leadId,createId,[self userModelForRow:row].icon];
    }
    
    NSURL *url = [NSURL URLWithString:iconStr];
    return url;
}
/**
 *  用户名
 */
- (NSString *)nikeNameForRow:(NSInteger)row {
    NSString *createId = [NSString stringWithFormat:@"%ld",[self userModelForRow:row].ID];
    if ([createId isEqualToString:@"0"]) {
        return @"匿名用户";
    }
    return [self userModelForRow:row].login;
}

/**
 *  糗事类型
 */
- (NSString *)typeForRow:(NSInteger)row {
    return [self itemsModelForRow:row].type;
}


/**
 *  文字内容
 */
- (NSString *)textContentForRow:(NSInteger)row {
    return [self itemsModelForRow:row].content;
}
/**
 *  图片内容
 */
- (NSURL *)imageContentForRow:(NSInteger)row {
    NSString *path = @"http://pic.qiushibaike.com/system/pictures/";
    NSString *createId = [NSString stringWithFormat:@"%ld",[self itemsModelForRow:row].ID];
    NSString *iconStr = @"";
    if (![createId isEqualToString:@"0"]) {
        NSString *leadId = [createId substringWithRange:NSMakeRange(0, 5)];
        iconStr = [NSString stringWithFormat:@"%@/%@/%@/medium/%@",path,leadId,createId,[self itemsModelForRow:row].image];
    }
    return [NSURL URLWithString:iconStr];
}
/**
 *  图片的高度
 */
- (CGFloat)imageHeightForRow:(NSInteger)row {
    NSArray *m = [self itemsModelForRow:row].image_size.m;
    if (m.count == 0) {
        return 0;
    }
    NSString *w = m[1];
    NSString *h = m[0];
    NSInteger ww = w.integerValue;
    NSInteger hh = h.integerValue;
    CGFloat height = ww*1.0/hh * kWindowW;
    return height;
}

/**
 *  视频内容地址
 */
- (NSURL *)videoURLForRow:(NSInteger)row {
    NSURL *videoURL = [NSURL URLWithString:[self itemsModelForRow:row].low_url];
    return videoURL;
}
/**
 *  视频对应的图片
 */
- (NSURL *)videoImageURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self itemsModelForRow:row].pic_url];
}

/**
 *  视频对应的图片高度
 */
- (CGFloat)videoImageHeightForRow:(NSInteger)row {
    NSArray *videoImg = [self itemsModelForRow:row].pic_size;
    if (videoImg.count == 0) {
        return 0;
    }
    NSString *w = videoImg[1];
    NSString *h = videoImg[0];
    NSInteger ww = w.integerValue;
    NSInteger hh = h.integerValue;
    CGFloat height = ww*1.0/hh * kWindowW;
    return height;
}
/**
 *  好笑和评论的人数
 */
- (NSString *)funNumberForRow:(NSInteger)row {
    NSInteger up = [self votesModelForRow:row].up;
    NSInteger down = [self votesModelForRow:row].down;
    NSInteger commentNum = [self itemsModelForRow:row].comments_count;
    NSInteger shareCount = [self itemsModelForRow:row].share_count;
    NSInteger loopCount = [self itemsModelForRow:row].loop;
    
    NSString *commentStr = [NSString stringWithFormat:@" · 评论 %ld",commentNum];
    if (commentNum == 0) {
        commentStr = @"";
    }else if (commentNum > 10000) {
        commentStr = [NSString stringWithFormat:@" · 评论 %ld万",commentNum/10000];
    }
    
    
    NSString *shareStr = [NSString stringWithFormat:@" · 分享 %ld",shareCount];
    if (shareCount == 0) {
        shareStr = @"";
    }else if (shareCount > 10000) {
        shareStr = [NSString stringWithFormat:@" · 分享 %ld万",shareCount/10000];
    }
    
    
    NSString *loopStr = [NSString stringWithFormat:@" · 再生 %ld",loopCount];
    if (loopCount == 0) {
        loopStr = @"";
    }else if (loopCount > 10000) {
        loopStr = [NSString stringWithFormat:@" · 再生 %ld万",loopCount/10000];
    }
    
    
    return [NSString stringWithFormat:@"好笑 %ld%@%@%@",up - down,commentStr,shareStr,loopStr];
}


/**
 *  获取数据
 */

- (void)getDataComletionHandle:(void(^)(NSError *error))completionHandle {
    [QiuBaiNetworkManager getQiuBaiModelWithType:self.type andPage:self.page completionHandle:^(QiuBaiModel *model, NSError *error) {
        completionHandle(error);
        if (self.page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.items];
    }];
}

- (void)refreshDataComletionHandle:(void(^)(NSError *error))completionHandle {
    self.page = 1;
    [self getDataComletionHandle:completionHandle];
    
}
- (void)getMoreDataComletionHandle:(void(^)(NSError *error))completionHandle {
    self.page++;
    [self getDataComletionHandle:completionHandle];
}

@end
