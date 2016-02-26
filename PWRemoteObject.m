//
//  PWRemoteObject.m
//  
//
//  Created by Peter Wegener on 05.03.15.
//  Copyright (c) 2015 Peter Wegener. All rights reserved.
//

#import "PWRemoteObject.h"
#import <objc/runtime.h>

@implementation PWRemoteObject
@synthesize data;


- (id)init {
	if( (self = [super init]) ) {
		data = [[NSMutableDictionary alloc] initWithObjectsAndKeys:NSStringFromClass([self class]), @"__className__", nil];
	}
	return self;
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        data = [aDecoder decodeObjectForKey:@"data"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:data forKey:@"data"];
}

// needed by XML-parser
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
        NSLog(@"");
}

- (id)valueForUndefinedKey:(NSString *)key {
    return @"";
}


- (void)setValue:(id)value forKey:(NSString *)key {
	[data setValue:value forKey:key];
}

- (id)valueForKey:(NSString *)key {
	return [data valueForKey:key];
}

- (NSDictionary*)toDictionary {
    NSMutableDictionary *d = [data map:^(NSString *key, id value) {
        if( [value isKindOfClass:[NSArray class]] ) {
            NSMutableArray *ary = [NSMutableArray array];
            
            for(id obj in value){
                if( [obj respondsToSelector:@selector(toDictionary)] ) {
                    [ary addObject:[obj toDictionary]];
                } else {
                    [ary addObject:obj];
                }
            }
            return (id)ary;
        } else if( [value respondsToSelector:@selector(toDictionary)] ) {
            return (id)[value performSelector:@selector(toDictionary)];
        } else {
            return (id)value;
        }
    }];
	return d;
}


@end
