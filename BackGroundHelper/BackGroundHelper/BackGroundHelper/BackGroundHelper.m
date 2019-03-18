//
//  BackGroundHelper.m
//  BackGroundHelper
//
//  Created by maso on 2019/3/18.
//  Copyright © 2019年 Hanssea. All rights reserved.
//

#import "BackGroundHelper.h"
#import <UIKit/UIKit.h>
@interface BackGroundHelper ()
{
    BOOL _keeping;//是否处于保持状态
}
@end
@implementation BackGroundHelper
+ (BackGroundHelper *)shared
{
    static BackGroundHelper *sharedHelper;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedHelper = [[BackGroundHelper alloc] init];
    });
    return sharedHelper;
}
- (id)init
{
    self = [super init];
    if (self) {
    }
    return self;
}
- (void)dealloc
{
}
#pragma mark --- 具体实现方式
-(void)keep{
    _keeping=YES;
    while (_keeping) {
        [NSThread sleepForTimeInterval:1];
        /** clean the runloop for other source */
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 0, TRUE);
    }
}
- (void)stop{
    _keeping=NO;
}
- (void)run{
    
    UIApplication *application = [UIApplication sharedApplication];
    __block UIBackgroundTaskIdentifier backGround_tash_identifier;
    backGround_tash_identifier = [application beginBackgroundTaskWithExpirationHandler: ^ {
        [self keep];
        [application endBackgroundTask: backGround_tash_identifier];
        backGround_tash_identifier = UIBackgroundTaskInvalid;
    }];
}
@end
