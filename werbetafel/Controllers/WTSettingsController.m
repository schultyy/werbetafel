//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTSettingsController.h"
#import "WTModelContext.h"
#import "WTSettingsDelegate.h"

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

-(IBAction) saveAndClose:(id) sender {
    NSError *error = nil;
    if([[[self modelContext] managedObjectContext] save:&error]) {
        if(self.delegate) {
            [self.delegate settingsControllerDidFinish:self];
        }
        [[self window] orderOut: self];
    }
    else {
        [self presentError:error modalForWindow:self.window delegate:nil didPresentSelector:NULL contextInfo:NULL];
    }
}

-(IBAction) saveWithoutClosing:(id) sender {
    [[[self modelContext] managedObjectContext] reset];
    if(self.delegate) {
        [self.delegate settingsControllerDidFinish:self];
    }
    [[self window] orderOut: self];
}

@end