//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTImageScheduler.h"
#import "WTModelContext.h"
#import "WTDesktop.h"
#import "WTImageConfig.h"

@interface WTImageScheduler()
@property (strong) WTModelContext *modelContext;
@property (strong) WTDesktop *desktop;
@end


@implementation WTImageScheduler

-(id) init {
    self = [super init];
    if(self) {
        [self setModelContext:[[WTModelContext alloc] init]];
        [self setDesktop:[[WTDesktop alloc] init]];
    }
    return self;
}

-(void)handleSystemTimeChanged {
    NSLog(@"System time changed");
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];
    NSLog(@"components");

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WTImageConfig"];
    NSLog(@"fetch");
    NSLog(@"Hour %li", components.hour);
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"hour = %li", components.hour]];

    NSLog(@"predicate");
    NSError *error = nil;
    NSArray *resultSet = [[[self modelContext] managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if(resultSet) {
        if([resultSet count] > 0) {
            NSLog(@"Has results");
            WTImageConfig *image = [resultSet firstObject];
            NSLog(@"Image %@", image.imagePath);
            [[self desktop] setNewWallpaper:image.imagePath];
        }
    } else {
        [NSApp willNotPresentError:error];
    }
}

@end