//
//  QiuBaiModel.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiModel.h"

@implementation QiuBaiModel

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [QiuBaiItemsModel class]};
}

@end

@implementation QiuBaiItemsModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end


@implementation ItemsVotesModel

@end


@implementation ItemsUserModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

@end


