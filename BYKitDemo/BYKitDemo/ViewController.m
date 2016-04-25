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

- (void)viewDidLoad
{
    [super viewDidLoad];

    // NSObject+BYKit

    NSLog(@"selector1 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector1)]);

    NSLog(@"selector2 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector2)]);

    NSLog(@"selector3 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector3:) withObject:@"String1"]);

    NSLog(@"selector4 result: %@\n\n", [self byk_performSelectorIfPossible:@selector(selector4:object:) withObject:@"String1" withObject:@"String2"]);
}

#pragma mark - NSObject+BYKit

- (void)selector1
{
    NSLog(@"Performing selector1 ...");
}

- (NSString *)selector2
{
    NSLog(@"Performing selector2 ...");

    return @"selector2";
}

- (NSString *)selector3:(NSString *)string
{
    NSLog(@"Performing selector3:%@ ...", string);

    return [NSString stringWithFormat:@"selector3 %@", string];
}

- (NSString *)selector4:(NSString *)string1 object:(NSString *)string2
{
    NSLog(@"Performing selector4:%@ object:%@", string1, string2);

    return [NSString stringWithFormat:@"selector4 %@ %@", string1, string2];
}

@end
