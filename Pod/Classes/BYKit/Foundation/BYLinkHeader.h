//
//  BYLinkHeader.h
//  BYKitDemo
//
//  Created by Barry on 2016/11/30.
//  Copyright © 2016 Barry Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BYLinkHeader : NSObject

@property (strong, nonatomic, readonly) NSURL *next;
@property (strong, nonatomic, readonly) NSURL *last;
@property (strong, nonatomic, readonly) NSURL *first;
@property (strong, nonatomic, readonly) NSURL *prev;

- (instancetype)initWithHTTPResponse:(NSHTTPURLResponse *)response;

@end
