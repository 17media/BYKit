//
//  UIView+BYKit.m
//  BYKitDemo
//
//  Created by BoyLee on 2016/9/7.
//  Copyright (c) 2016年 BarryLee. All rights reserved.
//

#import "UIView+BYKit.h"
#import "BYKit+QuartzCore.h"

@implementation UIView (BYKit)

- (UIImage *)byk_snapshotImage {
    return [self.layer byk_snapshotImage];
}

- (NSArray *)byk_containingViewsWithClassName:(NSString *)className {
    NSMutableArray *containingViews = [NSMutableArray array];
    if ([self isKindOfClass:NSClassFromString(className)]) {
        [containingViews addObject:self];
    }
    for (UIView *view in self.subviews) {
        [containingViews addObjectsFromArray:[view byk_containingViewsWithClassName:className]];
    }
    
    return containingViews;
}

@end
