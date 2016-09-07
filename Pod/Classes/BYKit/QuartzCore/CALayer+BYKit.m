//
//  CALayer+BYKit.m
//  BYKitDemo
//
//  Created by BoyLee on 2016/9/7.
//  Copyright (c) 2016年 BarryLee. All rights reserved.
//

#import "CALayer+BYKit.h"

@implementation CALayer (BYKit)

- (UIImage *)byk_snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0.0);
    [self renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return capturedImage;
}

@end
