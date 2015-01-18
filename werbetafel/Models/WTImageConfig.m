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
    NSString *path = [[imagePath filePathURL] absoluteString];
    [self setPrimitiveValue:path forKey:@"imagePath"];
    [self didChangeValueForKey:@"imagePath"];
}

-(void)setHour:(id)hour {
    [self willChangeValueForKey:@"hour"];
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];
    [self setPrimitiveValue:@(components.hour) forKey:@"hour"];
    [self didChangeValueForKey:@"hour"];
}

@end
