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
    NSDate *now = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WTImageConfig"];
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"hour = %d", components.hour]];

    NSError *error = nil;
    NSArray *resultSet = [[[self modelContext] managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if(resultSet) {
        if([resultSet count] > 0) {
            WTImageConfig *image = [resultSet firstObject];
            [[self desktop] setNewWallpaper:image.imagePath];
        }
    } else {
        [NSApp willNotPresentError:error];
    }
}

@end