//
//  QiuBaiNetworkManager.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseNetworkManager.h"
#import "QiuBaiModel.h"
#import "QiuBaiNearByModel.h"

typedef NS_ENUM(NSUInteger, QiuBaiType) {
    QiuBaiTypeVIP,      // 专享
    QiuBaiTypeVideo,    // 视频
    QiuBaiTypeText,     // 纯文
    QiuBaiTypeImgrank,  // 纯图
    QiuBaiTypeDay,      // 精华
    QiuBaiTypeLatest    // 最新
};

@interface QiuBaiNetworkManager : BaseNetworkManager

/**
 *  获取 糗事 数据并进行解析
 *
 *  @param type             类型
 *  @param page             当前的页数
 *  @param completionHandle 模型和出错信息
 */
+ (void)getQiuBaiModelWithType:(QiuBaiType)type andPage:(NSInteger)page completionHandle:(void(^)(QiuBaiModel *model,NSError *error))completionHandle;

/**
 *  获取 糗友圈 数据
 *
 *  @param page             页数
 *  @param latitude
 *  @param longitude
 *  @param completionHandle
 */
+ (void)getNearbyModelWithPage:(NSInteger)page latitude:(NSInteger)latitude longitude:(NSInteger)longitude completionHandle:(void(^)(QiuBaiNearByModel *model,NSError *error))completionHandle;

@end
