//
//  BaseViewModel.h
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewModel : NSObject
/**
 *  行数
 */
@property (nonatomic) NSInteger rowNumber;
/**
 *  存储当前数据
 */
@property (strong, nonatomic) NSMutableArray *dataArr;
/**
 *  当前页数
 */
@property (nonatomic) NSInteger page;


/**
 *  获取数据
 */

- (void)refreshDataComletionHandle:(void(^)(NSError *error))completionHandle;
- (void)getMoreDataComletionHandle:(void(^)(NSError *error))completionHandle;

@end
