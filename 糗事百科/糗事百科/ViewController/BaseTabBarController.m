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
#import "LoginViewController.h"
#import "WMPageController.h"


@interface BaseTabBarController ()<UITabBarControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
    /** 糗事控制器 */
    MainViewController *mainVC = [self mainVCStyle];
    mainVC.tabBarItem.tag = 200;
    [self setChildVC:mainVC andTitle:@"糗事" andNormalImage:@"icon_main" andSelectedImage:@"icon_main_active"];
    /** 糗友圈控制器 */
    FriendViewController *friendVC = [[FriendViewController alloc] init];
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


- (MainViewController *)mainVCStyle {
    MainViewController *vc = [[MainViewController alloc] initWithViewControllerClasses:[self itemControllerClass] andTheirTitles:[self itemNames]];
    vc.keys = [self vcKeys];
    vc.values = [self vcValues];
    vc.menuViewStyle = WMMenuViewStyleLine;
    vc.menuItemWidth = kWindowW/6.0;
    vc.progressColor = kRGBColor(255, 160, 21);
    vc.titleColorSelected = kRGBColor(255, 160, 21);
    vc.titleSizeNormal = 18;
    vc.titleSizeSelected = 18;
    vc.progressHeight = 3;
    
    return vc;
}

- (NSArray *)itemNames {
    return @[@"专享",@"视频",@"纯文",@"纯图",@"精华",@"最新"];
}

- (NSArray *)itemControllerClass {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        [arr addObject:[QiuBaiListViewController class]];
    }
    return [arr copy];
}

- (NSArray *)vcKeys {
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger count = [self itemNames].count;
    for (int i = 0; i < count; i++) {
        [arr addObject:@"type"];
    }
    return [arr copy];
}

- (NSArray *)vcValues {
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger count = [self itemNames].count;
    for (int i = 0; i <count ; i++) {
        [arr addObject:@(i)];
    }
    return [arr copy];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    if (viewController.tabBarItem.tag == 100) {
        LoginViewController *vc = [LoginViewController new];
        vc.hidesBottomBarWhenPushed = YES;
        [((UINavigationController *)tabBarController.selectedViewController) pushViewController:vc animated:YES];
        return NO;
    }
    if (viewController.tabBarItem.tag == 200) {
        
    }
    return YES;
}



@end
