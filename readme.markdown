Momentum
========

Momentum is a collection of objective c classes and categories that extends NSArray and NSMutableArray with declarative-style in-memory query and set operations.

Usage
=====

Drop the files into your project and #include. Make changes to the files as you need. All I ask is that you share your updates with me.

Sample
======

	NSMutableArray * strings = [[NSMutableArray alloc] initWithObjects:@"ken", @"jane", @"james", @"ivan", @"randy", nil];
	[[strings 
	    where:(id)^(id string) { return [string isEqualToString:@"james"] || [string isEqualToString:@"ken"]; }]
	    forin:^(id string) { NSLog(@"%@", string); }];