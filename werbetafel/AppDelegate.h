//
//  AppDelegate.h
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "WTSettingsDelegate.h"

@interface AppDelegate : NSObject <NSApplicationDelegate, WTSettingsDelegate>

@property (retain) NSStatusItem *statusItem;

@property (strong, nonatomic) NSStatusItem *statusBar;

@property (strong) NSTimer *timer;

@property IBOutlet NSMenu *mainMenu;

-(IBAction)showSettingsDialog:(id)sender;

-(IBAction) quitApplication: (id) sender;

@end

