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
//    return 12;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NearbyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NearbyCell" forIndexPath:indexPath];
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
