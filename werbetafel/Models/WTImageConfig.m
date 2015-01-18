//
//  WTImageConfig.m
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import "WTImageConfig.h"


@implementation WTImageConfig

@dynamic imagePath;
@dynamic hour;

-(void) setImagePath:(NSURL *)imagePath {
    [self willChangeValueForKey:@"imagePath"];
    NSString *path = [imagePath path];
    [self setPrimitiveValue:path forKey:@"imagePath"];
    [self didChangeValueForKey:@"imagePath"];
}

-(void)setHour:(id)dateTime {
    [self willChangeValueForKey:@"hour"];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:dateTime];
    [self setPrimitiveValue:@(components.hour) forKey:@"hour"];
    [self didChangeValueForKey:@"hour"];
}

-(id) hour {
    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMinute:0];
    [components setHour:[[self primitiveValueForKey:@"hour"] integerValue]];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [gregorian dateFromComponents:components];
}

@end
