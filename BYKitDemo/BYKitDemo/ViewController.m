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
    
    NSLog(@"Start loading link header...");

    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:@"https://api.github.com/users?page=2&per_page=2"]];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
            BYLinkHeader *linkHeader = [[BYLinkHeader alloc] initWithHTTPResponse:(NSHTTPURLResponse *)response];
            NSLog(@"Link header:\nnext:%@\nlast:%@\nfirst:%@\nprev:%@\n", linkHeader.next, linkHeader.last, linkHeader.first, linkHeader.prev);
        }
    }];
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
                                     CGRectGetMaxY(demoSwitch.frame),
                                     CGRectGetWidth(demoImageView.frame),
                                     CGRectGetHeight(demoImageView.frame));
    NSLog(@"Snapshot imageView:%@", demoImageView);
    
    demoSwitch.tintColor = [UIColor blackColor];
    
    NSArray *imageViewArray = [self.view byk_containingViewsWithClassName:NSStringFromClass(UIImageView.class)];
    NSLog(@"All UIImageView classes in self.view:%@", imageViewArray);
    
    UITabBar *tabBar = [UITabBar new];
    tabBar.items = @[[[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:0],
                     [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1],
                     [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:2],
                     [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:3],
                     [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:4]
                     ];
    ((UITabBarItem *)tabBar.items[1]).badgeValue = @"1";
    ((UITabBarItem *)tabBar.items[2]).badgeValue = @"20";
    ((UITabBarItem *)tabBar.items[3]).badgeValue = @"300";
    ((UITabBarItem *)tabBar.items[4]).badgeValue = @"4000";
    [tabBar byk_updateBadgesWithFont:[UIFont systemFontOfSize:11.0f] fontColor:[UIColor blackColor] backgroundColor:[UIColor cyanColor]];
    [self.view addSubview:tabBar];
    [tabBar sizeToFit];
    tabBar.frame = CGRectMake(0,
                              CGRectGetHeight(self.view.frame) - CGRectGetHeight(tabBar.frame),
                              CGRectGetWidth(tabBar.frame),
                              CGRectGetHeight(tabBar.frame));
    
    NSLog(@"=============================BYNonSelectableTextView=============================\n");
    BYNonSelectableTextView *textView = [BYNonSelectableTextView new];
    [self.view addSubview:textView];
    textView.attributedText = [[NSAttributedString alloc] initWithString:@"Apple"
                                                              attributes:@{
                                                                           NSUnderlineStyleAttributeName: @(NSUnderlineStyleSingle),
                                                                           NSLinkAttributeName: @"https://www.apple.com"
                                                                           }];
    [textView sizeToFit];
    textView.center = self.view.center;
    textView.frame = CGRectMake(CGRectGetMinX(textView.frame),
                                CGRectGetMaxY(demoImageView.frame),
                                CGRectGetWidth(textView.frame),
                                CGRectGetHeight(textView.frame));
}

@end
