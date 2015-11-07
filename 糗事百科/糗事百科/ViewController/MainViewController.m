//
//  MainViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "MainViewController.h"
#import "QiuBaiListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviStyle];
    
}

- (void)setNaviStyle {
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"icon_review"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 50, 40);
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"icon_post_new"] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 50, 40);
    
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
}

+ (UINavigationController *)standardQiuBaiNavi {
    static UINavigationController *navi = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MainViewController *vc = [[MainViewController alloc] initWithViewControllerClasses:[self itemControllerClass] andTheirTitles:[self itemNames]];
        /**  */
        vc.keys = [self vcKeys];
        vc.values = [self vcValues];
        
        navi = [[UINavigationController alloc] initWithRootViewController:vc];
    });
    return navi;
}

+ (NSArray *)itemNames {
    return @[@"专享",@"视频",@"纯文",@"纯图",@"精华",@"最新"];
}

+ (NSArray *)itemControllerClass {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        [arr addObject:[QiuBaiListViewController class]];
    }
    return [arr copy];
}

+ (NSArray *)vcKeys {
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger count = [self itemNames].count;
    for (int i = 0; i < count; i++) {
        [arr addObject:@"QiuBaiType"];
    }
    return [arr copy];
}

+ (NSArray *)vcValues {
    NSMutableArray *arr = [NSMutableArray array];
    NSInteger count = [self itemNames].count;
    for (int i = 0; i <count ; i++) {
        [arr addObject:@(i)];
    }
    return [arr copy];
}



@end
