//
//  QiuBaiModel.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseModel.h"

@class QiuBaiItemsModel,ItemsVotesModel,ItemsUserModel,ItemsImageSizeModel;
@interface QiuBaiModel : BaseModel


@property (nonatomic, assign) NSInteger err;

@property (nonatomic, assign) NSInteger refresh;

@property (nonatomic, assign) NSInteger count;

@property (nonatomic, strong) NSArray<QiuBaiItemsModel *> *items;

@property (nonatomic, assign) NSInteger total;

@property (nonatomic, assign) NSInteger page;


@end
@interface QiuBaiItemsModel : NSObject

@property (nonatomic, assign) NSInteger published_at;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger comments_count;

@property (nonatomic, strong) NSArray<NSNumber *> *pic_size;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, copy) NSString *low_url;

@property (nonatomic, assign) NSInteger loop;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, strong) ItemsImageSizeModel *image_size;

@property (nonatomic, copy) NSString *image;

@property (nonatomic, copy) NSString *tag;

@property (nonatomic, assign) BOOL allow_comment;

@property (nonatomic, assign) NSInteger share_count;

@property (nonatomic, strong) ItemsUserModel *user;

@property (nonatomic, copy) NSString *high_url;

@property (nonatomic, strong) ItemsVotesModel *votes;

@end

@interface ItemsImageSizeModel : NSObject

@property (strong, nonatomic) NSArray *m;
@property (strong, nonatomic) NSArray *s;

@end


@interface ItemsVotesModel : NSObject

@property (nonatomic, assign) NSInteger up;

@property (nonatomic, assign) NSInteger down;

@end

@interface ItemsUserModel : NSObject

@property (nonatomic, copy) NSString *login;

@property (nonatomic, copy) NSString *icon;

@property (nonatomic, assign) NSInteger avatar_updated_at;

@property (nonatomic, assign) NSInteger created_at;

@property (nonatomic, copy) NSString *role;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *email;

@property (nonatomic, copy) NSString *last_device;

@property (nonatomic, copy) NSString *state;

@property (nonatomic, assign) NSInteger last_visited_at;

@end

