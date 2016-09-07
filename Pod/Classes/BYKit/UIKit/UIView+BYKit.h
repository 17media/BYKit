//
//  UIView+BYKit.h
//  BYKitDemo
//
//  Created by BoyLee on 2016/9/7.
//  Copyright (c) 2016年 BarryLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (BYKit)

- (UIImage *)byk_snapshotImage;
- (NSArray *)byk_containingViewsWithClassName:(NSString *)className;

@end
