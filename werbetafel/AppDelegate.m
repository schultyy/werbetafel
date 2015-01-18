//
//  AppDelegate.m
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import "AppDelegate.h"
#import "WTSettingsController.h"
#import "WTImageScheduler.h"

@interface AppDelegate()
@property (strong) WTSettingsController *settingsController;
@property (strong) WTImageScheduler *scheduler;
@end

@implementation AppDelegate

-(void) awakeFromNib {
    [super awakeFromNib];
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [[self statusBar] setTitle:@"werbetafel"];
    self.statusBar.menu = self.mainMenu;
    self.statusBar.highlightMode = YES;

    [self setScheduler:[[WTImageScheduler alloc] init]];
    [[self scheduler] handleSystemTimeChanged];
    [self setTimer: [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES]];
}

-(void) tick: (NSTimer *) theTimer{
    [[self scheduler] handleSystemTimeChanged];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

#pragma mark - WTSettingsDelegate

-(void) settingsControllerDidFinish: (WTSettingsController *) controller {
    [self setSettingsController:nil];
    [self setTimer:nil];
    [self setTimer: [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(tick:) userInfo:nil repeats:YES]];
}

#pragma mark - IBAction

-(IBAction)showSettingsDialog:(id)sender {
    NSLog(@"Settings");
    [[self timer] invalidate];
    [self setSettingsController: [[WTSettingsController alloc] init]];
    [[self settingsController] setDelegate:self];
    [[self settingsController] showWindow:self];
}

-(IBAction) quitApplication: (id) sender {
    [NSApp terminate: nil];
}

@end
