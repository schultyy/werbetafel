//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class WTModelContext;
@protocol WTSettingsDelegate;


@interface WTSettingsController : NSWindowController

@property (strong, readonly) WTModelContext *modelContext;
@property (assign) NSObject<WTSettingsDelegate> *delegate;

-(IBAction) saveAndClose:(id) sender;
-(IBAction) saveWithoutClosing:(id) sender;
@end