//
//  AppDelegate.h
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (retain) NSStatusItem *statusItem;

@property (strong, nonatomic) NSStatusItem *statusBar;

@property IBOutlet NSMenu *mainMenu;

-(IBAction)showSettingsDialog:(id)sender;

@end

