//
//  MainViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "MainViewController.h"
#import "QiuBaiListViewController.h"
#import "LoginViewController.h"

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
    LoginViewController *loginVC = [LoginViewController new];
    loginVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:loginVC animated:YES];
}


@end
