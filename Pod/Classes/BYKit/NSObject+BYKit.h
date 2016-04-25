//
//  NSObject+BYKit.h
//  BYKitDemo
//
//  Created by Barry on 4/25/16.
//  Copyright © 2016 BarryLee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BYKit)

- (id)byk_performSelectorIfPossible:(SEL)selector;
- (id)byk_performSelectorIfPossible:(SEL)selector withObject:(id)object1;
- (id)byk_performSelectorIfPossible:(SEL)selector withObject:(id)object1 withObject:(id)object2;

@end
