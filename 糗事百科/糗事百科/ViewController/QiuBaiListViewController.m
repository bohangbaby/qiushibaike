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

@property (strong, nonatomic) QiuBaiViewModel *qiuBaiVM;    // ViewModel层
@property (nonatomic) CGFloat cellHeigth;                   // cell的高度
@property (nonatomic) QiuBaiType type;                      // 列表的类型
@property (nonatomic) CGFloat imgHeight;                    // 图片的高度
@property (nonatomic) CGFloat videoHeight;                  // 视频的高度

@end

@implementation QiuBaiListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     *  注册ListTextCell
     */
    self.cellHeigth = 0;
    self.qiuBaiVM.type = self.type;
    /**
     *  设置分割线的样式为无
     */
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"default_pic_mask"]];
    [self.tableView registerClass:[ListTextCell class] forCellReuseIdentifier:@"ListTextCell"];
    
    
    /**
     *  数据刷新
     */
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    [header setImages:@[[UIImage imageNamed:@"loadmore_arrow"]] forState:MJRefreshStatePulling];
    [header setImages:@[[UIImage imageNamed:@"loadmore_loading"]] duration:0.3 forState:MJRefreshStateRefreshing];
    // 隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    // 隐藏状态
    header.stateLabel.hidden = YES;
    self.tableView.header = header;
    [self.tableView.header beginRefreshing];

    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
}

#pragma mark - 懒加载
- (QiuBaiViewModel *)qiuBaiVM {
    if (_qiuBaiVM == nil) {
        _qiuBaiVM = [[QiuBaiViewModel alloc] init];
    }
    return _qiuBaiVM;
}

#pragma mark - 加载数据
/**
 *  加载数据
 */
- (void)loadData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.qiuBaiVM refreshDataComletionHandle:^(NSError *error) {
        [self.tableView.header endRefreshing];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];

}

/**
 *  加载更多数据
 */
- (void)loadMoreData {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.qiuBaiVM getMoreDataComletionHandle:^(NSError *error) {
        [self.tableView.footer endRefreshing];
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
    }];
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
    cell.videoURL = [self.qiuBaiVM videoURLForRow:indexPath.section];
    if ([[self.qiuBaiVM typeForRow:indexPath.section] isEqualToString:@"hot"]) {
        [cell.type setImage:[UIImage imageNamed:@"subscribe_hot"] forState:UIControlStateNormal];
        [cell.type setTitle:@"热门" forState:UIControlStateNormal];
    }else if ([[self.qiuBaiVM typeForRow:indexPath.section] isEqualToString:@"fresh"]) {
        [cell.type setImage:[UIImage imageNamed:@"subscribe_nearby"] forState:UIControlStateNormal];
        [cell.type setTitle:@"新鲜" forState:UIControlStateNormal];
    }else
        cell.type.hidden = YES;
    
    
    cell.content.text = [self.qiuBaiVM textContentForRow:indexPath.section];
    self.cellHeigth = [self height:cell.content.text];
    /**
     *  内容图片
     */
    [cell.contentImg setImageWithURL:[self.qiuBaiVM imageContentForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"im_img_placeholder"]];
    /**
     *  重新布局图片的大小
     */
    self.imgHeight = [self.qiuBaiVM imageHeightForRow:indexPath.section];
    [cell.contentImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cell.content.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(self.imgHeight);
    }];
    
    [cell.videoImg setImageWithURL:[self.qiuBaiVM videoImageURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"im_img_placeholder"]];
    /**
     *  重新布局视频的位置
     */
    self.videoHeight = [self.qiuBaiVM videoImageHeightForRow:indexPath.section];
    [cell.videoImg mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(cell.contentImg.mas_bottom).mas_equalTo(5);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(self.videoHeight);
    }];
    cell.votes.text = [self.qiuBaiVM funNumberForRow:indexPath.section];
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}

/**
 *  动态设置每个cell的高度：图片的高度+视频的高度+文字内容的高度+评论区、头部用户信息（150）
 */
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150 + self.imgHeight + self.cellHeigth + self.videoHeight;
}

/**
 *  用来计算cell中的文字高度
 *
 *  @param text 传入的文字内容
 *
 *  @return 文字高度
 */
- (CGFloat)height:(NSString *)text {
    NSDictionary *attrbute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    return [text boundingRectWithSize:CGSizeMake(self.tableView.contentSize.width, 2000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attrbute context:nil].size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
}




@end
