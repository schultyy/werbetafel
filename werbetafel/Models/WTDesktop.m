//
// Created by Jules Winnfield on 18/01/15.
// Copyright (c) 2015 nein. All rights reserved.
//

#import "WTDesktop.h"
#import <Cocoa/Cocoa.h>

@implementation WTDesktop

-(void) setNewWallpaper: (NSString *) wallpaper {
    NSWorkspace *sws = [NSWorkspace sharedWorkspace];
    NSError *err = nil;
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