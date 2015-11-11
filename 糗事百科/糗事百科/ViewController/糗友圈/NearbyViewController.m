//
//  NearbyViewController.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/9.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "NearbyViewController.h"
#import "NearbyCell.h"
#import "QiuBaiNearbyViewModel.h"
#import "PhotoViewController.h"

@interface NearbyViewController ()

@property (strong, nonatomic) QiuBaiNearbyViewModel *nearbyVM;

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[NearbyCell class] forCellReuseIdentifier:@"NearbyCell"];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
       [self.nearbyVM refreshDataComletionHandle:^(NSError *error) {
           if (error) {
               
           }
           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
           [self.tableView.header endRefreshing];
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.tableView reloadData];
           });
       }];
    }];
    [self.tableView.header beginRefreshing];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
       [self.nearbyVM getMoreDataComletionHandle:^(NSError *error) {
           [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
           [self.tableView.footer endRefreshing];
           dispatch_async(dispatch_get_main_queue(), ^{
               [self.tableView reloadData];
           });
       }];
    }];
}

#pragma mark - 懒加载
- (QiuBaiNearbyViewModel *)nearbyVM {
    if (_nearbyVM == nil) {
        _nearbyVM = [[QiuBaiNearbyViewModel alloc] init];
    }
    return _nearbyVM;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.nearbyVM.rowNumber;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NearbyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NearbyCell" forIndexPath:indexPath];
    NearbyCell *cell = [[NearbyCell alloc] init];
    [cell.icon setImageWithURL:[self.nearbyVM iconURLForRow:indexPath.section] placeholderImage:[UIImage imageNamed:@"icon_anonymous"]];
    cell.nikeName.text = [self.nearbyVM nikeNameForRow:indexPath.section];
    if ([[self.nearbyVM genderForRow:indexPath.section] isEqualToString:@"M"]) {
        [cell.ageAndGender setBackgroundImage:[UIImage imageNamed:@"vote_group_candidate_male_bg"] forState:UIControlStateNormal];
        [cell.ageAndGender setTitle:[self.nearbyVM ageForRow:indexPath.section] forState:UIControlStateNormal];
        cell.ageAndGender.backgroundColor = kRGBColor(171, 211, 255);
    }else {
        [cell.ageAndGender setBackgroundImage:[UIImage imageNamed:@"vote_group_candidate_female_bg"] forState:UIControlStateNormal];
        [cell.ageAndGender setTitle:[self.nearbyVM ageForRow:indexPath.section] forState:UIControlStateNormal];
        cell.ageAndGender.backgroundColor = kRGBColor(253, 167, 206);
    }
    cell.createTime.text = [self.nearbyVM createTimeForRow:indexPath.section];
    cell.contentText.text = [self.nearbyVM contentForRow:indexPath.section];
    /**
     *  图片
     */
    NSInteger count = [self.nearbyVM imgCountForRow:indexPath.section];
    if (count) {
        [cell.allImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(cell.nikeName.mas_leftMargin);
            make.width.mas_equalTo(250);
            make.height.mas_equalTo(80);
        }];
        UIView *lastView = nil;
        NSInteger num = count > 3 ? 3 : count;
        for (int i = 0; i < num; i++) {
            CustomImageView *imageView = [CustomImageView new];
            [cell.allImageView addSubview:imageView];
            [imageView.imageView setImageWithURL:[self.nearbyVM contentImgForRow:indexPath.section][i] placeholderImage:[UIImage imageNamed:@"im_img_placeholder"]];
            [imageView.imageButton bk_addEventHandler:^(id sender) {
                PhotoViewController *photos = [[PhotoViewController alloc] init];
                photos.imagesArr = [self.nearbyVM contentImgForRow:indexPath.section];
                [self presentViewController:photos animated:YES completion:nil];
            } forControlEvents:UIControlEventTouchUpInside];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(0);
                make.size.mas_equalTo(CGSizeMake(80, 80));
                if (lastView) {
                    make.left.mas_equalTo(lastView.mas_right).mas_equalTo(5);
                }else {
                    make.left.mas_equalTo(0);
                }
            }];
            lastView = imageView;
        }
        if (count > 3) {
            UILabel *imageCountLabel = [[UILabel alloc] init];
            imageCountLabel.backgroundColor = kRGBColor(90, 90, 90);
            imageCountLabel.font = [UIFont systemFontOfSize:13];
            [cell.allImageView addSubview:imageCountLabel];
            [imageCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(18, 18));
                make.bottom.right.mas_equalTo(0);
            }];
            imageCountLabel.textColor = [UIColor whiteColor];
            imageCountLabel.text = [NSString stringWithFormat:@"%ld",count];
            imageCountLabel.textAlignment = NSTextAlignmentCenter;
        }
    }
    
    
  
    
    if ([self.nearbyVM isVotesForRow:indexPath.section]) {
        [cell.optionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(cell.nikeName.mas_leftMargin);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(cell.allImageView.mas_bottom).mas_equalTo(5);
            make.right.mas_equalTo(-10);
        }];
        
        /**
         *  更改投票按钮的内容
         */
        [cell.optionA setTitle:[self.nearbyVM voteContentForRow:indexPath.section][0] forState:UIControlStateNormal];
        [cell.optionA bk_addEventHandler:^(id sender) {
            cell.optionA.selected = YES;
            [cell.optionA setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
            [cell.optionA setTitle:[self.nearbyVM voteResultForRow:indexPath.section][0] forState:UIControlStateSelected];
            cell.optionA.enabled = NO;
            cell.optionB.enabled = NO;
            cell.vsImageView.backgroundColor = kRGBColor(133, 207, 41);
            cell.optionA.backgroundColor = kRGBColor(133, 207, 41);
            
            
        } forControlEvents:UIControlEventTouchUpInside];
        [cell.optionB setTitle:[self.nearbyVM voteContentForRow:indexPath.section][1] forState:UIControlStateNormal];
        [cell.optionB bk_addEventHandler:^(id sender) {
            cell.vsImageView.backgroundColor = kRGBColor(133, 207, 41);
            cell.optionB.backgroundColor = kRGBColor(133, 207, 41);
            cell.optionB.selected = YES;
            [cell.optionB setTitle:[self.nearbyVM voteResultForRow:indexPath.section][1] forState:UIControlStateSelected];
            cell.optionA.enabled = NO;
            cell.optionB.enabled = NO;
        } forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    cell.locationLb.text = [self.nearbyVM locationForRow:indexPath.section];
    [cell.likeBtn setTitle:[self.nearbyVM likeCountForRow:indexPath.section] forState:UIControlStateNormal];
    [cell.commentBtn setTitle:[self.nearbyVM commentCountForRow:indexPath.section] forState:UIControlStateNormal];
    
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 2;
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
