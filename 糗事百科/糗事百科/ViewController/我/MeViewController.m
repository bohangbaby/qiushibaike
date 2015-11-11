//
//  MeViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "MeViewController.h"
#import "LoginNaviViewController.h"
#import "SettingViewController.h"


@interface MeViewController ()

/** 夜间模式按钮 */
@property (strong, nonatomic) UISwitch *swit;

@end

@implementation MeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我";
    [self.tableView setSeparatorColor:kRGBColor(240, 240, 240)];
    self.view.backgroundColor = kRGBColor(247, 247, 247);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableFooterView = [UIView new];
}
#pragma mark - 懒加载

- (UISwitch *)swit {
    if (_swit == nil) {
        _swit = [[UISwitch alloc] init];
    }
    return _swit;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
        case 1:
            return 1;
        case 2:
        case 3:
            return 2;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    switch (indexPath.section) {
        case 0:
            cell.imageView.bounds = CGRectMake(0, 0, 120, 120);
            cell.imageView.image = [UIImage imageNamed:@"icon_anonymous"];
            cell.textLabel.font = [UIFont systemFontOfSize:18];
            cell.textLabel.text = @"登录/注册";
            cell.detailTextLabel.numberOfLines = 0;
            cell.detailTextLabel.textColor = [UIColor grayColor];
            cell.detailTextLabel.text = @"还没账号?没关系，现在您可以使用QQ或微博账号直接登录糗百";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"icon_posted"];
            cell.textLabel.text = @"管理我的糗事";
            break;
        case 2:
            if (indexPath.row == 0) {
                cell.imageView.image = [UIImage imageNamed:@"icon_myfriends"];
                cell.textLabel.text = @"我的糗友/群";
            }else {
                cell.imageView.image = [UIImage imageNamed:@"icon_for_search_myfriends"];
                cell.textLabel.text = @"添加糗友";
            }
            break;
        case 3:
            if (indexPath.row == 0) {
                cell.imageView.image = [UIImage imageNamed:@"icon_nightmode"];
                cell.textLabel.text = @"夜间模式";
                cell.accessoryView = self.swit;
            }else {
                cell.imageView.image = [UIImage imageNamed:@"icon_setting"];
                cell.textLabel.text = @"设置";
            }
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    }else
        return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    kLogin
    switch (indexPath.section) {
        case 0:
        case 1:
        case 2:
            [self presentViewController:navi animated:YES completion:nil];
            break;
        case 3:
            if (indexPath.row == 0) {
            }else {
                /** 进入设置页面 */
                SettingViewController *setVC = [[SettingViewController alloc] init];
                setVC.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:setVC animated:YES];
            }
            break;
            
        default:
            break;
    }
}


@end
