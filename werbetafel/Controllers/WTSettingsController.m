//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTSettingsController.h"
#import "WTModelContext.h"

@interface WTSettingsController()
@property (strong, readwrite) WTModelContext *modelContext;
@end

@implementation WTSettingsController

-(id) init {
    self = [super initWithWindowNibName:@"WTSettingsWindow"];
    if(self) {
        [self setModelContext:[[WTModelContext alloc] init]];
    }
    return self;
}

@end