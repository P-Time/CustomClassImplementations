//
//  PWPair.m
//  
//
//  Created by Peter Wegener on 05.03.15.
//  Copyright 2015 Peter Wegener. All rights reserved.
//

#import "PWPair.h"


@implementation PWPair

+ (PWPair*)pairWithFirst:(id)f second:(id)s {
	return [[PWPair alloc] initWithFirst:f second:s];
}

- (id)initWithFirst:(id)f second:(id)s {
	if ((self = [super init])) {
		[self setFirst:f];
		[self setSecond:s];
	}
	return self;
}

- (NSString*)description {
	return [NSString stringWithFormat:@"{\n\tfirst: %@\n\tsecond: %@\n}", self.first, self.second];
}



- (id)first {
    if (_first == nil) {
        _first = [data valueForKey:@"first"];
    }
    return _first;
}

- (id)second {
    if (_second == nil) {
        _second = [data valueForKey:@"second"];
    }
    return _second;
}

- (void)setFirst:(id)first {
    [self setValue:first forKey:@"first"];
    if (first != _first) {
        _first = first;
    }
}

- (void)setSecond:(id)second {
    [self setValue:second forKey:@"second"];
    if (second != _second) {
        _second = second;
    }
}

#pragma mark - Memory management

@end
