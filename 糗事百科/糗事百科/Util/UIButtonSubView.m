//
//  UIButtonSubView.m
//  weibo
//
//  Created by apple-jd35 on 15/10/23.
//  Copyright © 2015年 apple-jd35. All rights reserved.
//

#import "UIButtonSubView.h"

@implementation UIButtonSubView

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.frame.size.height/2.4;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = CGRectGetMaxY(self.imageView.frame) + 5;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = UITextAlignmentCenter;
}

@end
