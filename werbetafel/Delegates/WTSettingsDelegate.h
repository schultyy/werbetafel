//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WTSettingsController;
@protocol WTSettingsDelegate <NSObject>

-(void) settingsControllerDidFinish: (WTSettingsController *) controller;

@end