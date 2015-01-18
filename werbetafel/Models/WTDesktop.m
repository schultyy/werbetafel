//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTDesktop.h"
#import <Cocoa/Cocoa.h>

@interface WTDesktop()
@property (retain) NSString *currentWallpaper;
@end

@implementation WTDesktop

-(id) init {
    self = [super init];
    if(self) {
        [[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self
                                                               selector:@selector(workspaceDidChange:)
                                                                   name:NSWorkspaceActiveSpaceDidChangeNotification
                                                                 object:nil];
    }
    return self;
}

-(void) workspaceDidChange:(NSNotification *) notification {
    if(self.currentWallpaper) {
        [self setNewWallpaper:self.currentWallpaper];
    }
}

-(void) setNewWallpaper: (NSString *) wallpaper {
    NSWorkspace *sws = [NSWorkspace sharedWorkspace];
    NSError *err = nil;
    [self setCurrentWallpaper:wallpaper];
    NSURL *wallpaperUrl = [NSURL fileURLWithPath:wallpaper];
    for (NSScreen *screen in [NSScreen screens]) {
        NSDictionary *opt = [sws desktopImageOptionsForScreen:screen];
        [sws setDesktopImageURL: wallpaperUrl forScreen:screen options:opt error:&err];
        if (err) {
            NSLog(@"%@",[err localizedDescription]);
        }else{
            NSNumber *scr = [screen deviceDescription][@"NSScreenNumber"];
            NSLog(@"Set %@ for space %i on screen %@",wallpaper,[self spaceNumber],scr);
        }
    }
}

-(int)spaceNumber
{
    CFArrayRef windowsInSpace = CGWindowListCopyWindowInfo(kCGWindowListOptionAll | kCGWindowListOptionOnScreenOnly, kCGNullWindowID);
    for (NSMutableDictionary *thisWindow in (__bridge NSArray *)windowsInSpace)    {
        if (thisWindow[(id) kCGWindowWorkspace]){
            return [thisWindow[(id) kCGWindowWorkspace] intValue];
        }
    }
    return -1;
}

@end