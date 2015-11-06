//
//  AppDelegate.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "BaseTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    BaseTabBarController *vc = [[BaseTabBarController alloc] init];
    self.window.rootViewController = vc;
    
    return YES;
}


#pragma mark - 懒加载
- (UIWindow *)window {
    if (_window == nil) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
        [_window makeKeyAndVisible];
    }
    return _window;
}


@end
