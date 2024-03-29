//
//  DiscoverViewController.m
//  糗事百科
//
//  Created by Hanten on 15/11/6.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发现";
    self.tableView.backgroundColor = kRGBColor(247, 247, 247);
    self.tableView.separatorColor = kRGBColor(247, 247, 247);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.tableView.tableHeaderView = [self headerView];
}
/**
 *  显示发现的头部视图
 *
 *  @return 头部视图
 */
- (UIView *)headerView {
    UIView *view = [UIView new];
    view.frame = CGRectMake(0, 0, kWindowW, 100);
    view.backgroundColor = [UIColor whiteColor];
    CGFloat widthButton = kWindowW/4.0;
    CGFloat yButton = (100 - kWindowW/4.0)/2.0;

    [view addSubview:[self buttonWithTitle:@"附近" image:[UIImage imageNamed:@"discovery_nearby"] x:0 y:yButton width:widthButton]];
    [view addSubview:[self buttonWithTitle:@"任意门" image:[UIImage imageNamed:@"discovery_freeGate"] x:widthButton y:yButton width:widthButton]];
    [view addSubview:[self buttonWithTitle:@"群" image:[UIImage imageNamed:@"discovery_group"] x:widthButton*2 y:yButton width:widthButton]];
    [view addSubview:[self buttonWithTitle:@"糗百货" image:[UIImage imageNamed:@"discovery_qiubaihuo"] x:widthButton*3 y:yButton width:widthButton]];
    
    return view;
}

/**
 *  用来生成指定图文上下结构的按钮
 *
 *  @param title    文字
 *  @param image    图片
 *  @param x        x轴
 *  @param y        y轴
 *  @param width    宽度
 *
 *  @return 生成的按钮
 */
- (UIButtonSubView *)buttonWithTitle:(NSString *)title image:(UIImage *)image x:(CGFloat)x y:(CGFloat)y width:(CGFloat)width {
    UIButtonSubView *button = [UIButtonSubView new];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setImage:image forState:UIControlStateNormal];
    button.frame = CGRectMake(x, y, width, width);
    return button;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"Cell"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.detailTextLabel.font = [UIFont systemFontOfSize:14];
    switch (indexPath.section) {
        case 0:
            cell.imageView.image = [UIImage imageNamed:@"discovery_small_group"];
            cell.textLabel.text = @"群";
            cell.detailTextLabel.text = @"来看看周围的组织吧";
            break;
        case 1:
            cell.imageView.image = [UIImage imageNamed:@"discovery_small_qiubaihuo"];
            cell.textLabel.text = @"糗百货";
            cell.detailTextLabel.text = @"萌萌哒周边，买买买";
            break;
        case 2:
            cell.imageView.image = [UIImage imageNamed:@"discovery_smallgame"];
            cell.textLabel.text = @"游戏";
            cell.detailTextLabel.text = @"精选好玩游戏，停不下来";
            break;
        case 3:
            cell.imageView.image = [UIImage imageNamed:@"discovery_small_xjdmg"];
            cell.textLabel.text = @"小鸡炖蘑菇";
            cell.detailTextLabel.text = @"糗事百科出品大综艺";
            break;
            
        default:
            break;
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
