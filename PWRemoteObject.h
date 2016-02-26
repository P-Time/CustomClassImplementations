//
//  PWRemoteObject.h
//
//
//  Created by Peter Wegener on 05.03.15.
//  Copyright (c) 2015 Peter Wegener. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PWGetter(__TYPE__, __X__) - (__TYPE__)__X__ {return [data valueForKey:@#__X__];}

#define PWDateGetter(__X__) - (NSDate*)__X__ {if( [[data valueForKey:@#__X__] isKindOfClass:[NSString class]] ) { return [NSDate dateFromXML:[data valueForKey:@#__X__]]; } else { return [data valueForKey:@#__X__]; }}
#define PWStringGetter(__X__) - (NSString*)__X__ {return [data valueForKey:@#__X__];}
#define PWIntGetter(__X__) - (int)__X__ {return [[data valueForKey:@#__X__] intValue];}
#define PWFloatGetter(__X__) - (float)__X__ {return [[data valueForKey:@#__X__] floatValue];}
#define PWDoubleGetter(__X__) - (double)__X__ {return [[data valueForKey:@#__X__] doubleValue];}
#define PWBoolGetter(__X__) - (BOOL)__X__ { id value = [data valueForKey:@#__X__]; if( [value isKindOfClass:[NSString class]] && [value isEqualToString:@"true"] ) { return YES; } else if( [value isKindOfClass:[NSString class]] && [value isEqualToString:@"false"] ) { return NO; } else { return [value boolValue]; } }

#define PWProperty(__TYPE__, __X__) - (__TYPE__)__X__;

@class PWRemoteObject;

@interface PWRemoteObject : NSObject <NSCoding> {
    NSMutableDictionary* data;
}

@property(nonatomic, readonly) NSMutableDictionary *data;


- (void)setValue:(id)value forUndefinedKey:(NSString *)key;
- (id)valueForUndefinedKey:(NSString *)key;
- (id)valueForKey:(NSString *)key;


@end

