//
//  BaseNavigationController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    /** 设置导航栏不透明 */
    self.navigationBar.translucent = NO;
    /** 导航栏的样式 */
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = kRGBColor(40, 40, 40);
    dic[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    self.navigationBar.titleTextAttributes = dic;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
