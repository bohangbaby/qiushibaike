//
//  QiuBaiNearByModel.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseModel.h"

@class NearbyDataModel,DataVoteModel,DataUserModel,DataPicUrlsModel;
@interface QiuBaiNearByModel : BaseModel


@property (nonatomic, assign) BOOL has_more;

@property (nonatomic, strong) NSArray<NearbyDataModel *> *data;

@property (nonatomic, assign) NSInteger err;

@property (nonatomic, assign) NSInteger refresh;

@property (nonatomic, assign) NSInteger total;


@end
@interface NearbyDataModel : NSObject

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *distance;

@property (nonatomic, assign) NSInteger like_count;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, strong) NSArray<DataPicUrlsModel *> *pic_urls;

@property (nonatomic, copy) NSString *loaction;

@property (nonatomic, assign) NSInteger comment_count;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, strong) DataVoteModel *vote;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, strong) DataUserModel *user;

@end

@interface DataVoteModel : NSObject

@property (strong, nonatomic) NSString *option_a;
@property (strong, nonatomic) NSString *option_b;
@property (nonatomic) NSInteger ID;
@property (nonatomic) NSInteger oa_count;
@property (nonatomic) NSInteger ob_count;


@end

@interface DataUserModel : NSObject

@property (nonatomic, copy) NSString *gender;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, assign) NSInteger age;

@property (nonatomic, assign) NSInteger nick_status;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, copy) NSString *login;

@end

@interface DataPicUrlsModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *pic_url;

@end

