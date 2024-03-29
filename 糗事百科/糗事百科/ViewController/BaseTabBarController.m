//
//  BaseTabBarController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "BaseTabBarController.h"
#import "MainViewController.h"
#import "FriendViewController.h"
#import "DiscoverViewController.h"
#import "ChatViewController.h"
#import "MeViewController.h"
#import "BaseNavigationController.h"
#import "QiuBaiListViewController.h"
#import "LoginNaviViewController.h"
#import "WMPageController.h"
#import "NearbyViewController.h"


@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    
    /** 糗事控制器 */
    MainViewController *mainVC = [[MainViewController alloc] initWithStyle];
    mainVC.tabBarItem.tag = 200;
    [self setChildVC:mainVC andTitle:@"糗事" andNormalImage:@"icon_main" andSelectedImage:@"icon_main_active"];
    /** 糗友圈控制器 */
    FriendViewController *friendVC = [[FriendViewController alloc] initWithStyle];
    [self setChildVC:friendVC andTitle:@"糗友圈" andNormalImage:@"main_tab_qbfriends" andSelectedImage:@"main_tab_qbfriends_active"];
    /** 发现控制器 */
    DiscoverViewController *discoverVC = [[DiscoverViewController alloc] init];
    [self setChildVC:discoverVC andTitle:@"发现" andNormalImage:@"main_tab_discovery" andSelectedImage:@"main_tab_discovery_active"];
    /** 小纸条控制器 */
    ChatViewController *chatVC = [[ChatViewController alloc] init];
    chatVC.tabBarItem.tag = 100;
    [self setChildVC:chatVC andTitle:@"小纸条" andNormalImage:@"icon_chat" andSelectedImage:@"icon_chat_active"];
    /** 我的控制器 */
    MeViewController *meVC = [[MeViewController alloc] init];
    [self setChildVC:meVC andTitle:@"我" andNormalImage:@"icon_me" andSelectedImage:@"icon_me_active"];
    
}


/**
 *  用来设置tabbar子控制器的样式
 *
 *  @param vc            传入的控制器
 *  @param title         tabBarItem的title
 *  @param normalImage   tabBarItem的正常图片
 *  @param selectedImage tabBarItem中的被选中时的图片
 */
- (void)setChildVC:(UIViewController *)vc andTitle:(NSString *)title andNormalImage:(NSString *)normalImage andSelectedImage:(NSString *)selectedImage {
    [vc.tabBarItem setImage:[UIImage imageNamed:normalImage]];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.title = title;
    NSMutableDictionary *textNormalAtt = [NSMutableDictionary dictionary];
    NSMutableDictionary *textSelectedAtt = [NSMutableDictionary dictionary];
    textSelectedAtt[NSForegroundColorAttributeName] = kRGBColor(255, 160, 21);
    [vc.tabBarItem setTitleTextAttributes:textNormalAtt forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:textSelectedAtt forState:UIControlStateSelected];
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
}


#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController.tabBarItem.tag == 100) {
        /**
         *  此处应该添加是否登录的判断...假如用户已经登录，就进入小纸条的界面，反之跳转到登录界面
         */
        LoginViewController *vc = [LoginViewController new];
        LoginNaviViewController *nav = [[LoginNaviViewController alloc] initWithRootViewController:vc];
        vc.hidesBottomBarWhenPushed = YES;
        [((UINavigationController *)tabBarController.selectedViewController) presentViewController:nav animated:YES completion:nil];
        return NO;
    }
    if (viewController.tabBarItem.tag == 200) {
        
    }
    return YES;
}



@end
