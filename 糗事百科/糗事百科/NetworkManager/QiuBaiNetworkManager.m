//
//  QiuBaiNetworkManager.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiNetworkManager.h"
#import "QiuBaiPathHeader.h"

@implementation QiuBaiNetworkManager

/**
 *  获取网络数据并进行解析
 *
 *  @param type             类型
 *  @param page             当前的页数
 *  @param completionHandle 模型和出错信息
 */
+ (void)getQiuBaiModelWithType:(QiuBaiType)type andPage:(NSInteger)page completionHandle:(void(^)(QiuBaiModel *model,NSError *error))completionHandle {
    NSString *path = @"";
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    switch (type) {
        case QiuBaiTypeVIP: {
            path = kDayPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113670457%2C113659336%5D" AdID:@"1446810629497802FEE4DD"] copy];
            break;
        }
        case QiuBaiTypeVideo: {
            path = kVideoPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113676024%2C113670774%2C113669915%5D" AdID:@"1446810286071502FEE4DD"] copy];
            break;
        }
        case QiuBaiTypeText: {
            path = kTextPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113662411%5D" AdID:@"1446810374427602FEE4DD"] copy];
            break;
        }
        case QiuBaiTypeImgrank: {
            path = kImgrankPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113677388%2C113677178%2C113678397%2C113675594%5D" AdID:@"1446810466398102FEE4DD"] copy];
            break;
        }
        case QiuBaiTypeDay: {
            path = kDayPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113670457%2C113659336%5D" AdID:@"1446810629497802FEE4DD"] copy];
            break;
        }
        case QiuBaiTypeLatest: {
            path = kLatestPath;
            params = [[self pramaWithCount:30 page:page readarticles:@"%5B113663825%2C113678226%5D" AdID:@"1446810717404002FEE4DD"] copy];
            break;
        }
        default: {
            break;
        }
    }
    
    [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([QiuBaiModel objectWithKeyValues:responseObj],error);
    }];
    
}

// 代码封装，传入key的值即可
+ (NSDictionary *)pramaWithCount:(NSInteger)count page:(NSInteger)page readarticles:(NSString *)readarticles AdID:(NSString *)AdID {
    NSMutableDictionary *prama = [NSMutableDictionary dictionary];
    [prama setValue:@(count) forKey:@"count"];
    [prama setValue:@(page) forKey:@"page"];
    [prama setValue:readarticles forKey:@"readarticles"];
    [prama setValue:AdID forKey:@"AdID"];
    return prama;
}
// 专享
+ (NSDictionary *)pramaVIPWithPage:(NSInteger)page {
    NSMutableDictionary *prama = [NSMutableDictionary dictionary];
    [prama setValue:@(30) forKey:@"count"];
    [prama setValue:@(page) forKey:@"page"];
    [prama setValue:@"%5B113725323%2C113723946%2C113733864%2C113734784%5D" forKey:@"readarticles"];
    [prama setValue:@"refresh" forKey:@"type"];
    [prama setValue:@"113.2495236575455" forKey:@"longitude"];
    [prama setValue:@"14471535263299FE25" forKey:@"AdID"];
    return prama;
}


+ (void)getNearbyModelWithPage:(NSInteger)page latitude:(NSInteger)latitude longitude:(NSInteger)longitude completionHandle:(void(^)(QiuBaiNearByModel *model,NSError *error))completionHandle {
    NSString *path = kNearbyPath;
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:@(page) forKey:@"page"];
    [params setValue:@(latitude) forKey:@"latitude"];
    [params setValue:@(longitude) forKey:@"longitude"];
    
    [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        completionHandle([QiuBaiNearByModel objectWithKeyValues:responseObj],error);
    }];
}

@end
