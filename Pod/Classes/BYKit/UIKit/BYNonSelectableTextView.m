//
//  BYNonSelectableTextView.m
//  BYKitDemo
//
//  Created by BoyLee on 2016/10/18.
//  Copyright (c) 2016年 BarryLee. All rights reserved.
//

#import "BYNonSelectableTextView.h"

@implementation BYNonSelectableTextView

#pragma mark - Lifecycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Override

- (void)setText:(NSString *)text {
    [super setText:text];
    [self removeSelectionRecognizers];
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
    [super setAttributedText:attributedText];
    [self removeSelectionRecognizers];
}

- (BOOL)becomeFirstResponder {
    return NO;
}

#pragma mark - Private

- (void)setup {
    self.editable = NO;
    self.dataDetectorTypes = UIDataDetectorTypeLink;
}

- (void)removeSelectionRecognizers {
    for (UIGestureRecognizer *recoginizer in self.gestureRecognizers) {
        if (![recoginizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
            continue ;
        }
        if ([NSStringFromClass(recoginizer.class).lowercaseString rangeOfString:@"select"].location == NSNotFound) {
            continue ;
        }
        [self removeGestureRecognizer:recoginizer];
    }
}

@end
