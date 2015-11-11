//
//  CustomImageView.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/11.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "CustomImageView.h"

@implementation CustomImageView

-(id)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        _imageButton = [UIButton new];
        [self addSubview:_imageView];
        [self addSubview:_imageButton];
        //按比例放大,充满
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        [_imageButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
