//
//  AppDelegate.m
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import "AppDelegate.h"
#import "WTSettingsController.h"

@interface AppDelegate ()
@property (strong) WTSettingsController *settingsController;
@end

@implementation AppDelegate

-(void) awakeFromNib {
    [super awakeFromNib];
    self.statusBar = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [[self statusBar] setTitle:@"werbetafel"];
    self.statusBar.menu = self.mainMenu;
    self.statusBar.highlightMode = YES;

}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
}

#pragma mark - IBAction

-(IBAction)showSettingsDialog:(id)sender {
    [self setSettingsController: [[WTSettingsController alloc] init]];
    [[self settingsController] showWindow:self];
}

@end
