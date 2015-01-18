//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTImageScheduler.h"
#import "WTModelContext.h"
#import "WTDesktop.h"

@interface WTImageScheduler()
@property (strong) WTModelContext *modelContext;
@end


@implementation WTImageScheduler

-(id) init {
    self = [super init];
    if(self) {
        [self setModelContext:[[WTModelContext alloc] init]];
    }
    return self;
}

-(void)handleSystemTimeChanged {
    NSLog(@"Time change %@", NSDate.date);
//    NSDate *now = [NSDate date];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSDateComponents *components = [calendar components:NSHourCalendarUnit fromDate:now];
//
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"WTImageConfig"];
//    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"hour == %@", components.hour]];
//
//    NSError *error = nil;
//    if([[[self modelContext] managedObjectContext] executeFetchRequest:fetchRequest error:&error]) {
//
//    } else {
//        [NSApp willNotPresentError:error];
//    }
}

@end