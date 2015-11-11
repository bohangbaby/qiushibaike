//
//  MainViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "MainViewController.h"
#import "QiuBaiListViewController.h"
#import "LoginNaviViewController.h"
#import "QiuBaiNearbyViewModel.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNaviStyle];
    
}

/**
 *  设置导航栏的样式
 */
- (void)setNaviStyle {

    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"icon_review"] forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(0, 0, 50, 40);
    [leftBtn addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"icon_post_new"] forState:UIControlStateNormal];
    rightBtn.frame = CGRectMake(0, 0, 50, 40);
    [rightBtn addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
    
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -40, 0, 0);
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -40);
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo"]];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
    
}

- (void)loginView {
    kLogin
    [self presentViewController:navi animated:YES completion:nil];
}

/**
 *  必须用此方法初始化，来布局分页样式
 *
 *  @return 初始化对象
 */
- (instancetype)initWithStyle {
    if (self = [super init]) {
        self = [[MainViewController alloc] initWithViewControllerClasses:[self itemControllerClass] andTheirTitles:[self itemNames]];
        self.keys = [self vcKeys];
        self.values = [self vcValues];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = kWindowW/6.0;
        self.progressColor = kRGBColor(255, 160, 21);
        self.titleColorNormal = kRGBColor(40, 40, 40);
        self.titleColorSelected = kRGBColor(255, 160, 21);
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 4;
    }
    return self;
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





@end
