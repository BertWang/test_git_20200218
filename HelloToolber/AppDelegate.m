//
//  AppDelegate.m
//  HelloToolber
//
//  Created by git-116 on 2020/2/18.
//  Copyright © 2020 Bert.Wang. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (IBAction)saveXXXMenuItemSelected:(id)sender {
    //NSApplication.sharedApplication.mainWindow;
    //NSApplication.sharedApplication.windows;
    //NSApplication.sharedApplication.mainWindow.contentViewController;
    if([NSApplication.sharedApplication.mainWindow.contentViewController isKindOfClass:[ViewController class]]){
        ViewController *vc = (ViewController*) NSApplication.sharedApplication.mainWindow.contentViewController;
        [vc doInfoJob];
    }
    
    
}

@end
