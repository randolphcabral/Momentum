//
//  NSArray+Momentum.m
//
//  Created by Randolph Cabral on 8/11/11.
//  Copyright 2011 Randolph Cabral. All rights reserved.
//

#import "NSArray+Momentum.h"

@implementation NSArray (Momentum)


- (id) where:(id (^)(id))predicate
{
    NSMutableArray * retval = [[[NSMutableArray alloc] init] autorelease];
    for (id item in self) {
        if (predicate(item)) { [retval addObject:item]; }
    }
    return retval;
}

- (void) forin:(void (^)(id))action
{
    for (id obj in self) {
        action(obj);
    }
}

@end
