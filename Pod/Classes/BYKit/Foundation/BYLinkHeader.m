//
//  BYLinkHeader.m
//  BYKitDemo
//
//  Created by Barry on 2016/11/30.
//  Copyright © 2016 Barry Lee. All rights reserved.
//

#import "BYLinkHeader.h"

@implementation BYLinkHeader

- (instancetype)initWithHTTPResponse:(NSHTTPURLResponse *)response {
    self = [super init];
    
    NSString *linksArrayString = response.allHeaderFields[@"Link"];
    NSArray *linksArray = [linksArrayString componentsSeparatedByString:@", "];
    
    for (NSString *linkString in linksArray) {
        NSRegularExpression *urlExpression = [NSRegularExpression regularExpressionWithPattern:@"<.*>" options:NSRegularExpressionUseUnicodeWordBoundaries error:nil];
        NSTextCheckingResult *urlResult = [urlExpression matchesInString:linkString options:0 range:NSMakeRange(0, linkString.length)].firstObject;
        NSString *urlString = [linkString substringWithRange:NSMakeRange(urlResult.range.location + 1, urlResult.range.length - 2)];
        NSURL *url = [NSURL URLWithString:urlString];
        
        NSRegularExpression *relExpression = [NSRegularExpression regularExpressionWithPattern:@"rel=\".*\"" options:NSRegularExpressionUseUnicodeWordBoundaries error:nil];
        NSTextCheckingResult *relResult = [relExpression matchesInString:linkString options:0 range:NSMakeRange(0, linkString.length)].firstObject;
        NSString *relString = [linkString substringWithRange:NSMakeRange(relResult.range.location + 5, relResult.range.length - 6)];
        
        if ([relString isEqualToString:@"next"]) {
            _next = url;
            continue;
        } else if ([relString isEqualToString:@"last"]) {
            _last = url;
            continue;
        } else if ([relString isEqualToString:@"first"]) {
            _first = url;
            continue;
        } else if ([relString isEqualToString:@"prev"]) {
            _prev = url;
            continue;
        }
    }
    return self;
}

@end
