//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WTModelContext;


@interface WTSettingsController : NSWindowController

@property (strong, readonly) WTModelContext *modelContext;

-(IBAction) saveAndClose:(id) sender;
-(IBAction) saveWithoutClosing:(id) sender;
@end