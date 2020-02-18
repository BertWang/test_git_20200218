//
//  ViewController.m
//  HelloToolber
//
//  Created by git-116 on 2020/2/18.
//  Copyright © 2020 Bert.Wang. All rights reserved.
//

#import "ViewController.h"




@implementation ViewController{
    NSObject *dbLock;
    NSLock *accesslock;
    NSCondition *sharedCondition;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dbLock = [NSObject new];
    accesslock = [NSLock new];
    sharedCondition = [NSCondition new];
    
    // Do any additional setup after loading the view.
    NSString  *hello = NSLocalizedString(@"HELLO", "");
    NSLog(@"hello:%@",hello);
    
    
    NSThread *thread1 = [[NSThread alloc] initWithBlock:^{
        while (true) {
            [self job1];
            //[self doSometihg1:1];
            [NSThread sleepForTimeInterval:0.5];
        }
    }];
    
    [thread1 start];
 
    NSThread *thread2 = [[NSThread alloc] initWithBlock:^{
         while (true) {
            [self job2];
            //[self doSometihg1:1];
            [NSThread sleepForTimeInterval:0.5];
        }
    }];
    
    [thread2 start];
     
}

- (void) job1 {
    [sharedCondition lock];
    NSLog(@"Job1 strart.");
    [NSThread sleepForTimeInterval:3];
    
    NSLog(@"Job1 signal");
    [sharedCondition signal];
    

    NSLog(@"Job1 end.");
    [sharedCondition unlock];
}


- (void) job2 {
    [sharedCondition lock];
    NSLog(@"Job2 strart.");
    [NSThread sleepForTimeInterval:1];
    
    NSLog(@"Job2 wait.");
    [sharedCondition wait];
    
    //Must wait Job1 finish
    NSLog(@"Job2 end.");
    [sharedCondition unlock];
}

- (void) job3 {
    [sharedCondition lock];
    NSLog(@"Job2 strart.");
    [NSThread sleepForTimeInterval:1];
    
    NSLog(@"Job2 wait.");
    [sharedCondition wait];
    
    //Must wait Job1 finish
    NSLog(@"Job2 end.");
    [sharedCondition unlock];
}


- (void) doSometihg1:(NSInteger)threadIndex {
    
    @synchronized (dbLock){
        
        NSLog(@"doSomething1 start: %ld", threadIndex);
        
        [NSThread sleepForTimeInterval:3];
        
        NSLog(@"doSomething1 start: %ld", threadIndex);
    }
}

- (void) doSometihg2:(NSInteger)threadIndex {
    
    //[accesslock lock];
    if([accesslock tryLock]){
        
        NSLog(@"doSomething1 start: %ld", threadIndex);
        
        [NSThread sleepForTimeInterval:3];
        
        NSLog(@"doSomething1 start: %ld", threadIndex);
        
        [accesslock unlock];
    }
    
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)menuItemSelected:(NSMenuItem*)sender {
    NSLog(@"%ld",sender.tag);
    switch (sender.tag) {
        case 1:
            NSLog(@"%ld",sender.tag);
            break;
        default:
            [self doInfoJob];
            break;
    }
    //[self doInfoJob];
}

- (void) doInfoJob{
    NSLog(@"doInfoJob be called");
}


@end
