//
//  AppDelegate.m
//  werbetafel
//
//  Created by Jules Winnfield on 18/01/2015.
//  Copyright (c) 2015 nein. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
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

@end
