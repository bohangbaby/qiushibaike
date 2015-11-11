//
//  LoginViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录/注册";
    self.tableView.backgroundColor = kRGBColor(247, 247, 247);
    self.tableView.separatorColor = kRGBColor(240, 240, 240);
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    /** 取消按钮 */
    UIButton *cancel = [UIButton new];
    cancel.frame = CGRectMake(0, 0, 60, 30);
    [cancel setTitle:@"取消" forState:UIControlStateNormal];
    [cancel setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    cancel.titleEdgeInsets = UIEdgeInsetsMake(0, -30, 0, 0);
    [cancel bk_addEventHandler:^(id sender) {
        [self dismissViewControllerAnimated:YES completion:nil];
    } forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:cancel];
    
    self.tableView.tableFooterView = [self footerView];
}

/**
 *  底部登录按钮
 */

- (UIView *)footerView {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, kWindowW, 200);
    view.backgroundColor = kRGBColor(247, 247, 247);
    UIButton *loginButton = [UIButton new];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setBackgroundColor:[UIColor orangeColor]];
    loginButton.layer.cornerRadius = 3;
    loginButton.x = (kWindowW - 250) / 2.0;
    loginButton.size = CGSizeMake(250, 40);
    loginButton.y = 20;
    [view addSubview:loginButton];
    return view;
}

#pragma mark - Table view data source

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @[@"使用合作账号一键登录/注册",@"使用糗百账号登录"][section];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else
        return 2;
}

kRemoveCellSeparator

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [cell.contentView addSubview:[self otherLoginButtonWithNormalImage:[UIImage imageNamed:@"icon_bind_weixin"] andTitle:@"使用微信账号" andTitleColor:kRGBColor(68, 193, 123)]];
        }else if (indexPath.row == 1) {
            [cell.contentView addSubview:[self otherLoginButtonWithNormalImage:[UIImage imageNamed:@"icon_bind_qq"] andTitle:@"使用QQ账号" andTitleColor:kRGBColor(47, 172, 255)]];
        }else {
            [cell.contentView addSubview:[self otherLoginButtonWithNormalImage:[UIImage imageNamed:@"icon_bind_sina"] andTitle:@"使用微博账号" andTitleColor:kRGBColor(239, 63, 53)]];
        }
    }else {
        if (indexPath.row == 0) {
            [cell.contentView addSubview:[self loginTextFiledWith:@"邮箱/糗百昵称"]];
        }else {
            [cell.contentView addSubview:[self loginTextFiledWith:@"密码"]];
        }
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 60;
}


/**
 *  用来生成登录输入框的样式
 *
 *  @param placeholder 提示文字
 *
 *  @return 输入框
 */
- (UITextField *)loginTextFiledWith:(NSString *)placeholder {
    UITextField *textF = [[UITextField alloc] init];
    textF.placeholder = placeholder;
    textF.x = 20;
    textF.size = CGSizeMake(kWindowW-40, 40);
    textF.y = 0;
    return textF;
}


/**
 *  用来生成登录按钮的样式
 *
 *  @param image 图片
 *  @param title 文字内容
 *  @param color 文字的颜色
 *
 *  @return 一个登录按钮
 */
- (UIButton *)otherLoginButtonWithNormalImage:(UIImage *)image andTitle:(NSString *)title andTitleColor:(UIColor *)color {
    UIButton *button = [UIButton new];
    [button setImage:image forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.x = (kWindowW - 200) / 2.0;
    button.size = CGSizeMake(200, 40);
    button.y = 0;
    return button;
}


@end
