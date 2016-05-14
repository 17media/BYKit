//
//  NSObject+BYKit.m
//  BYKitDemo
//
//  Created by Barry on 4/25/16.
//  Copyright © 2016 BarryLee. All rights reserved.
//

#import "NSObject+BYKit.h"

@implementation NSObject (BYKit)

- (id)byk_performSelectorIfPossible:(SEL)selector
{
    return [self byk_performSelectorIfPossible:selector withObject:nil withObject:nil];
}

- (id)byk_performSelectorIfPossible:(SEL)selector withObject:(id)object1
{
    return [self byk_performSelectorIfPossible:selector withObject:object1 withObject:nil];
}

- (id)byk_performSelectorIfPossible:(SEL)selector withObject:(id)object1 withObject:(id)object2
{
    if (![self respondsToSelector:selector]) {
        return nil;
    }

    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[self methodSignatureForSelector:selector]];
    invocation.target = self;
    invocation.selector = selector;

    if (invocation.methodSignature.numberOfArguments > 2) {
        [invocation setArgument:&object1 atIndex:2];
        if (invocation.methodSignature.numberOfArguments > 3) {
            [invocation setArgument:&object2 atIndex:3];
        }
    }

    [invocation invoke];

    void *returnValuePointer = nil;

    if (invocation.methodSignature.methodReturnLength > 0) {
        [invocation getReturnValue:&returnValuePointer];
    }

    return (__bridge id)returnValuePointer;
}

@end
