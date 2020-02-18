//
//  MyWindoewsController.m
//  HelloToolber
//
//  Created by git-116 on 2020/2/18.
//  Copyright © 2020 Bert.Wang. All rights reserved.
//

#import "MyWindoewController.h"
#import "ViewController.h"

@interface MyWindoewController ()

@end

@implementation MyWindoewController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (IBAction)infoBtnPressed:(id)sender {
    
    if([self.contentViewController isKindOfClass:[ViewController class]]){
        ViewController *vc = (ViewController*) self.contentViewController;
        [vc doInfoJob];
    }
    
}



@end
