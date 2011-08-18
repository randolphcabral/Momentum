//
//  NSArray+Filtering.h
//  GneXcode4Tmpl
//
//  Created by Randy Cabral on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Query)

- (id) where:(id (^)(id))filter;
- (void) forin:(void (^)(id))action;

@end
