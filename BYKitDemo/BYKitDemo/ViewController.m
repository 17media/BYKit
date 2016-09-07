//
//  ViewController.m
//  BYKitDemo
//
//  Created by Barry on 4/25/16.
//  Copyright © 2016 BarryLee. All rights reserved.
//

#import "ViewController.h"
#import "BYKit.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    [self demoNSObject];
    [self demoUIView];
}

#pragma mark - NSObject+BYKit

- (void)demoNSObject {
    NSLog(@"=============================NSObject+BYKit=============================\n");
    
    NSLog(@"selector1 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector1)]);
    
    NSLog(@"selector2 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector2)]);
    
    NSLog(@"selector3 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector3:) withObject:@"String1"]);
    
    NSLog(@"selector4 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector4:object:) withObject:@"String1" withObject:@"String2"]);
    
    NSLog(@"unrecognized_selector1 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(unrecognized_selector1)]);
    
    NSLog(@"unrecognized_selector2 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(unrecognized_selector2)]);
    
    NSLog(@"unrecognized_selector3 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(unrecognized_selector3:) withObject:@"String1"]);
    
    NSLog(@"unrecognized_selector4 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(unrecognized_selector4:object:) withObject:@"String1" withObject:@"String2"]);
}

- (void)selector1 {
    NSLog(@"Performing selector1 ...");
}

- (NSString *)selector2 {
    NSLog(@"Performing selector2 ...");

    return @"selector2";
}

- (NSString *)selector3:(NSString *)string {
    NSLog(@"Performing selector3:%@ ...", string);

    return [NSString stringWithFormat:@"selector3 %@", string];
}

- (NSString *)selector4:(NSString *)string1 object:(NSString *)string2 {
    NSLog(@"Performing selector4:%@ object:%@", string1, string2);

    return [NSString stringWithFormat:@"selector4 %@ %@", string1, string2];
}

#pragma mark - UIView+BYKit

- (void)demoUIView {
    NSLog(@"=============================UIView+BYKit=============================\n");
    
    UISwitch *demoSwitch = [UISwitch new];
    [self.view addSubview:demoSwitch];
    demoSwitch.center = self.view.center;
    
    UIImage *demoSwitchSnapshotImage = [demoSwitch byk_snapshotImage];
    NSLog(@"Snapshot image:%@", demoSwitchSnapshotImage);
    
    UIImageView *demoImageView = [[UIImageView alloc] initWithImage:demoSwitchSnapshotImage];
    [self.view addSubview:demoImageView];
    demoImageView.frame = CGRectMake(CGRectGetMinX(demoSwitch.frame),
                                     CGRectGetMinY(demoSwitch.frame) + demoSwitchSnapshotImage.size.height,
                                     demoSwitchSnapshotImage.size.width,
                                     demoSwitchSnapshotImage.size.height);
    NSLog(@"Snapshot imageView:%@", demoImageView);
    
    demoSwitch.tintColor = [UIColor blackColor];
    
    NSArray *imageViewArray = [self.view byk_containingViewsWithClassName:NSStringFromClass(UIImageView.class)];
    NSLog(@"All UIImageView classes in self.view:%@", imageViewArray);
}

@end
