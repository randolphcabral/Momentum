//
//  NSArray+Filtering.m
//  GneXcode4Tmpl
//
//  Created by Randy Cabral on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSArray+Query.h"

@implementation NSArray (Query)


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
