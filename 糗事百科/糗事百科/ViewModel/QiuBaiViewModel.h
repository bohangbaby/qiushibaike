//
//  QiuBaiViewModel.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseViewModel.h"
#import "QiuBaiModel.h"
#import "QiuBaiNetworkManager.h"

@interface QiuBaiViewModel : BaseViewModel


/**
 *  当前的选中的类型：视频、专享、最新、精华、纯文、纯图
 */
@property (nonatomic) QiuBaiType type;
/**
 *  用户头像
 */
- (NSURL *)iconForRow:(NSInteger)row;
/**
 *  用户名
 */
- (NSString *)nikeNameForRow:(NSInteger)row;
/**
 *  糗事类型
 */
- (NSString *)typeForRow:(NSInteger)row;
/**
 *  文字内容
 */
- (NSString *)textContentForRow:(NSInteger)row;
/**
 *  图片内容
 */
- (NSURL *)imageContentForRow:(NSInteger)row;
/**
 *  图片的高度
 */
- (CGFloat)imageHeightForRow:(NSInteger)row;
/**
 *  视频内容地址
 */
- (NSURL *)videoURLForRow:(NSInteger)row;
/**
 *  视频对应的图片
 */
- (NSURL *)videoImageURLForRow:(NSInteger)row;

/**
 *  视频对应的图片高度
 */
- (CGFloat)videoImageHeightForRow:(NSInteger)row;

/**
 *  好笑和评论的人数
 */
- (NSString *)funNumberForRow:(NSInteger)row;


@end
