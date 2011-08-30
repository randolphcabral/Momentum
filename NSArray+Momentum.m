//
//  NSArray+Momentum.m
//  Momentum Extensions
//
//  Created by Randy Cabral on 8/11/11.
//  Copyright 2011 Randolph Cabral. All rights reserved.
//

#import "NSArray+Momentum.h"

@interface NSArray()
- (NSArray *) parseOrderByExpression: (NSString *) expressionToParse;
- (NSComparisonResult) comparator: (id) exprTuple;
@end

@implementation NSArray(Momentum)

- (void) forin:(void (^)(id))action
{
    for (id obj in self) {
        action(obj);
    }
}

- (NSArray *) where:(id (^)(id))predicate
{
    NSMutableArray * retval = [[[NSMutableArray alloc] init] autorelease];
    [self forin:^(id item) {
        if (predicate(item)) { [retval addObject:item]; }
    }];
    return retval;
}

- (NSArray *) orderBy: (NSString *) expression
{
    NSMutableArray * retval = [[NSMutableArray alloc] initWithArray:self copyItems:YES];
    [retval sortUsingDescriptors: [self parseOrderByExpression:expression]];
    return retval;
}

- (NSArray *) parseOrderByExpression: (NSString *) expressionToParse
{
    NSMutableArray * retval = [[[NSMutableArray alloc] init] autorelease];
    NSArray * exprParts = [[expressionToParse componentsSeparatedByString:@","] retain];
    [exprParts forin:^(id item) {
        NSArray * currentExprParts = [item componentsSeparatedByString:@" "]; 
        NSString * propertyName = [[currentExprParts objectAtIndex:0] trim];
        BOOL sortAscending = ([[[currentExprParts objectAtIndex:1] trim] uppercaseString] == @"ASC");
        NSSortDescriptor * descriptor = [[[NSSortDescriptor alloc] initWithKey:propertyName ascending:sortAscending] autorelease];
        [retval addObject: descriptor];
    }]; 
    [expressionToParse release];
    return retval;
}

- (NSArray *) take: (int) numberOfItems
{
    NSMutableArray * retval = [[[NSMutableArray alloc] init] autorelease];
    if (numberOfItems > self.count) { numberOfItems = self.count; }
    for (int i = 0; i < numberOfItems; i++) {
        [retval addObject:[self objectAtIndex:i]];
    }
    return retval;
}

- (NSArray *) skip: (int) numberOfItems
{
    NSMutableArray * retval = [[[NSMutableArray alloc] init] autorelease];
    for (int i = numberOfItems; i < self.count; i++) {
        [retval addObject:[self objectAtIndex:i]];
    }
    return retval;
}

@end
