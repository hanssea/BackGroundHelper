//
//  AppDelegate.m
//  BackGroundHelper
//
//  Created by maso on 2019/3/18.
//  Copyright © 2019年 Hanssea. All rights reserved.
//
/*********
 技术选型上：建议选用 SignalR 实时上传位置
 info 申明：
 
 <key>NSLocationAlwaysAndWhenInUseUsageDeion</key>
 <string> xxApp需要获取您的位置，用于描述用途 </string>
 <key>NSLocationAlwaysAndWhenInUseUsageDescription</key>
 <string> xxApp需要获取您的位置，用于描述用途 </string>
 <key>NSLocationAlwaysUsageDescription</key>
 <string> xxApp需要获取您的位置，用于描述用途 </string>
 <key>NSLocationUsageDescription</key>
 <string> xxApp需要获取您的位置，用于描述用途 </string>
 <key>NSLocationWhenInUseUsageDescription</key>
 <string> xxApp需要获取您的位置，用于描述用途 </string>
 
 
 */

#import "AppDelegate.h"
#import "BackGroundHelper/BackGroundHelper.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

#pragma 后台保活
/**
 程序进入--- 后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application {
    if ([[UIDevice currentDevice] isMultitaskingSupported]) {
        [[BackGroundHelper shared] run];
    }
    NSLog(@"[[BackGroundHelper shared] run];");
}
/**
 程序进入--- 前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application {
    [[BackGroundHelper shared] stop];
    NSLog(@"[[BackGroundHelper shared] stop];");
}

@end
