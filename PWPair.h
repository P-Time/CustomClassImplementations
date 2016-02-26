//
//  PWPair.h
//  
//
//  Created by Peter Wegener on 05.03.15.
//  Copyright 2015 Peter Wegener. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PWRemoteObject.h"

@interface PWPair : PWRemoteObject {
	id _first;
    id _second;
}

PWProperty(id, first)
PWProperty(id, second)

- (void)setFirst:(id)first;
- (void)setSecond:(id)second;

+ (PWPair*)pairWithFirst:(id)f second:(id)s;
- (id)initWithFirst:(id)f second:(id)s;

@end
