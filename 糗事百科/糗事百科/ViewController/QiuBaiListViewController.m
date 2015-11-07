//
//  QiuBaiListViewController.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/7.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "QiuBaiListViewController.h"
#import "QiuBaiViewModel.h"
#import "ListTextCell.h"

@interface QiuBaiListViewController ()

@property (strong, nonatomic) QiuBaiViewModel *qiuBaiVM;
@property (nonatomic) CGFloat cellHeigth;
@property (nonatomic) QiuBaiType type;

@end

@implementation QiuBaiListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  注册ListTextCell
     */
    self.cellHeigth = 0;
    self.qiuBaiVM.type = self.type;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_pic_mask"]];
    [self.tableView registerClass:[ListTextCell class] forCellReuseIdentifier:@"ListTextCell"];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
       [self.qiuBaiVM refreshDataComletionHandle:^(NSError *error) {
           if (error) {
               NSLog(@"ceshi");
           }
           [self.tableView.header endRefreshing];
           [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.tableView reloadData];
           });
       }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
        [self.qiuBaiVM getMoreDataComletionHandle:^(NSError *error) {
            if (error) {
                NSLog(@"ceshi");
            }
            [self.tableView.footer endRefreshing];
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        }];
    }];
    
    
}

#pragma mark - 懒加载
- (QiuBaiViewModel *)qiuBaiVM {
    if (_qiuBaiVM == nil) {
        _qiuBaiVM = [[QiuBaiViewModel alloc] init];
    }
    return _qiuBaiVM;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.qiuBaiVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListTextCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListTextCell" forIndexPath:indexPath];
    [cell.icon setImageWithURL:[self.qiuBaiVM iconForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"icon_anonymous"]];
    cell.nikeName.text = [self.qiuBaiVM nikeNameForRow:indexPath.section];
    cell.type.hidden = YES;
    cell.content.text = [self.qiuBaiVM textContentForRow:indexPath.section];
    self.cellHeigth = [self height:cell.content.text];
    cell.votes.text = [self.qiuBaiVM funNumberForRow:indexPath.section];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150 + self.cellHeigth;
}

- (CGFloat)height:(NSString *)text {
    //设置计算文本时字体的大小,以什么标准来计算
    NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    return [text boundingRectWithSize:CGSizeMake(self.tableView.contentSize.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 8;
}




@end
