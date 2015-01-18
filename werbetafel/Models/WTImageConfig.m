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
@dynamic time;

-(void) setImagePath:(NSURL *)imagePath {
    [self willChangeValueForKey:@"imagePath"];
    NSString *path = [imagePath absoluteString];
    [self setPrimitiveValue:path forKey:@"imagePath"];
    [self didChangeValueForKey:@"imagePath"];
}

@end
