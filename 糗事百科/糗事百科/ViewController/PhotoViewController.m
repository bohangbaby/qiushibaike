//
//  PhotoViewController.m
//  糗事百科
//
//  Created by apple-jd35 on 15/11/11.
//  Copyright © 2015年 hzq. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()<UIScrollViewDelegate>

@property (strong, nonatomic) UIScrollView *photoSV;
@property (strong, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) UILabel *pageCount;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.photoSV];
    NSInteger count = self.imagesArr.count;
    self.photoSV.frame = CGRectMake(0, 0, kWindowW, self.view.size.height);
    self.photoSV.contentSize = CGSizeMake(kWindowW * count, kWindowH);
    self.photoSV.backgroundColor = [UIColor blackColor];
    self.photoSV.showsHorizontalScrollIndicator = NO;
    self.photoSV.pagingEnabled = YES;
    for (int i = 0; i < count; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(kWindowW*i, 0, kWindowW, kWindowH);
        NSURL *url = self.imagesArr[i];
        [imageView setImageWithURL:url];
        [self.photoSV addSubview:imageView];
    }
    
    [self.view addSubview:self.pageCount];
    self.pageCount.text = [NSString stringWithFormat:@"1/%ld",self.imagesArr.count];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissCurrentView)];
    [self.photoSV addGestureRecognizer:tap];
    
}


#pragma mark - 懒加载
- (NSArray *)imagesArr {
    if (_imagesArr == nil) {
        _imagesArr = [NSArray array];
    }
    return _imagesArr;
}

- (UIScrollView *)photoSV {
    if (_photoSV == nil) {
        _photoSV = [[UIScrollView alloc] init];
        _photoSV.delegate = self;
    }
    return _photoSV;
}

- (UIPageControl *)pageControl {
    if (_pageControl == nil) {
        _pageControl = [[UIPageControl alloc] init];
    }
    return _pageControl;
}
- (UILabel *)pageCount {
    if (_pageCount == nil) {
        _pageCount = [[UILabel alloc] init];
        _pageCount.textColor = [UIColor whiteColor];
        _pageCount.centerX = (kWindowW - 120) / 2;
        _pageCount.size = CGSizeMake(120, 40);
        _pageCount.y = kWindowH - 40;
        _pageCount.textAlignment = NSTextAlignmentCenter;
    }
    return _pageCount;
}


- (void)dismissCurrentView {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offSet = scrollView.contentOffset;
    NSInteger currentPage = offSet.x/kWindowW + 0.5;
    if (self.imagesArr.count > 1) {
        self.pageCount.text = [NSString stringWithFormat:@"%ld/%ld",currentPage+1,self.imagesArr.count];
    }
}



@end
