//
//  BaseViewModel.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

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

- (void)refreshDataComletionHandle:(void(^)(NSError *error))completionHandle {
    /**
     *  刷新数据
     */
}
- (void)getMoreDataComletionHandle:(void(^)(NSError *error))completionHandle {
    /**
     *  获取更多地数据
     */
    
}


@end
