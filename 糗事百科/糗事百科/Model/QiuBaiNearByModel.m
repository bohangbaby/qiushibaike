//
//  QiuBaiNearByModel.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiNearByModel.h"

@implementation QiuBaiNearByModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [NearbyDataModel class]};
}
@end
@implementation NearbyDataModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

+ (NSDictionary *)objectClassInArray{
    return @{@"pic_urls" : [DataPicUrlsModel class]};
}

@end


@implementation DataVoteModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end


@implementation DataUserModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end


@implementation DataPicUrlsModel

@end


