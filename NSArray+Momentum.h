//
//  NSArray+Momentum.h
//
//  Created by Randolph Cabral on 8/11/11.
//  Copyright 2011 Randolph Cabral. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Momentum)

- (id) where:(id (^)(id))filter;
- (void) forin:(void (^)(id))action;

@end
