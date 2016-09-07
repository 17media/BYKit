//
//  UITabBar+BYKit.m
//  BYKitDemo
//
//  Created by BoyLee on 2016/9/7.
//  Copyright (c) 2016年 BarryLee. All rights reserved.
//

#import "UITabBar+BYKit.h"
#import "UIView+BYKit.h"

@implementation UITabBar (BYKit)

static NSInteger customBadgeLabelTag = 1701;

- (void)byk_updateBadgesWithFont:(UIFont *)font fontColor:(UIColor *)color backgroundColor:(UIColor *)backgroundColor {
    
    NSArray *badgeViews = [self byk_containingViewsWithClassName:@"_UIBadgeView"];
    
    for (UIView *badgeView in badgeViews) {
        for (UIView *subview in badgeView.subviews) {
            if (subview.tag == customBadgeLabelTag) {
                [subview removeFromSuperview];
            }
        }
        
        NSArray *labels = [badgeView byk_containingViewsWithClassName:NSStringFromClass(UILabel.class)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(badgeView.frame), CGRectGetHeight(badgeView.frame))];
        [label setFont:font];
        [label setText:[labels.firstObject text]];
        [label setBackgroundColor:backgroundColor];
        [label setTextColor:color];
        [label setTextAlignment:NSTextAlignmentCenter];
        label.layer.cornerRadius = CGRectGetHeight(label.frame) / 2;
        label.layer.masksToBounds = YES;
        label.tag = customBadgeLabelTag;
        
        [badgeView addSubview:label];
    }
}

@end
