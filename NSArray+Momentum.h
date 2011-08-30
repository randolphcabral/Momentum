//
//  NSArray+Momentum.h
//  Momentum Extensions
//
//  Created by Randy Cabral on 8/11/11.
//  Copyright 2011 Randolph Cabral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray(Momentum)

- (NSArray *) where:(id (^)(id))filter;
- (void) forin:(void (^)(id))action;
- (NSArray *) orderBy: (NSString *) propertyName;
- (NSArray *) take: (int) numberOfItems;
- (NSArray *) skip: (int) numberOfItems;

@end
