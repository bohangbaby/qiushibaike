
//
//  FriendViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "FriendViewController.h"
#import "NearbyViewController.h"
#import "LoginNaviViewController.h"

@interface FriendViewController ()

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"糗友圈";
    
    UIButton *leftButton = [UIButton new];
    [leftButton setImage:[UIImage imageNamed:@"qbf_foot"] forState:UIControlStateNormal];
    [leftButton setTitleColor:kRGBColor(255, 160, 21) forState:UIControlStateNormal];
    [leftButton setTitle:@"签到" forState:UIControlStateNormal];
    leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    leftButton.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 0);
    leftButton.frame = CGRectMake(0, 0, 70, 50);
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftButton];
    [leftButton addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *rightButton = [UIButton new];
    [rightButton setImage:[UIImage imageNamed:@"icon_post_new"] forState:UIControlStateNormal];
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20);
    rightButton.frame = CGRectMake(0, 0, 40, 50);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightButton];
    [rightButton addTarget:self action:@selector(loginView) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)loginView {
    kLogin
    [self presentViewController:navi animated:YES completion:nil];
}

- (instancetype)initWithStyle {
    if (self = [super init]) {
        self = [[FriendViewController alloc] initWithViewControllerClasses:[self itemControllerClass] andTheirTitles:[self itemNames]];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.menuItemWidth = kWindowW/2.0;
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
    return @[@"隔壁",@"已粉"];
}

- (NSArray *)itemControllerClass {
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        [arr addObject:[NearbyViewController class]];
    }
    return [arr copy];
}



@end
