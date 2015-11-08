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
- (NSInteger)rowNumber {
    return self.dataArr.count;
}

- (NSMutableArray *)dataArr {
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

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
 *  文字内容
 */
- (NSString *)textContentForRow:(NSInteger)row {
    return [self itemsModelForRow:row].content;
}
/**
 *  图片内容
 */
- (NSURL *)imageContentForRow:(NSInteger)row {
    // http://pic.qiushibaike.com/system/pictures/11370/113702548/medium/app113702548.jpg
    NSString *path = @"http://pic.qiushibaike.com/system/pictures/";
    NSString *createId = [NSString stringWithFormat:@"%ld",[self itemsModelForRow:row].ID];
    NSString *iconStr = @"";
    if (![createId isEqualToString:@"0"]) {
        NSString *leadId = [createId substringWithRange:NSMakeRange(0, 5)];
        iconStr = [NSString stringWithFormat:@"%@/%@/%@/medium/%@",path,leadId,createId,[self itemsModelForRow:row].image];
    }
    NSLog(@"图片地址:%@",iconStr);
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
    CGFloat height = ((NSInteger)m[0]/(NSInteger)m[1])*kWindowW;
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
    CGFloat height = ((NSInteger)videoImg[0]/(NSInteger)videoImg[1])*kWindowW;
    return height;
}
/**
 *  好笑和评论的人数
 */
- (NSString *)funNumberForRow:(NSInteger)row {
    NSInteger up = [self votesModelForRow:row].up;
    NSInteger down = [self votesModelForRow:row].down;
    NSInteger commentNum = [self itemsModelForRow:row].comments_count;
    return [NSString stringWithFormat:@"好笑 %ld · 评论 %ld",up - down,commentNum];
}


/**
 *  获取数据
 */

- (void)getDataComletionHandle:(void(^)(NSError *error))completionHandle {
    [QiuBaiNetworkManager getQiuBaiModelWithType:self.type andPage:_page completionHandle:^(QiuBaiModel *model, NSError *error) {
        completionHandle(error);
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.items];
    }];
}

- (void)refreshDataComletionHandle:(void(^)(NSError *error))completionHandle {
    _page = 1;
    [self getDataComletionHandle:completionHandle];
    
}
- (void)getMoreDataComletionHandle:(void(^)(NSError *error))completionHandle {
    _page++;
    [self getDataComletionHandle:completionHandle];
}

@end
