//
//  AppDelegate.m
//  ProtoBufferDemo
//
//  Created by WTY on 17/3/29.
//  Copyright © 2017年 WTY. All rights reserved.
//

#import "AppDelegate.h"
#import <YTKKeyValueStore/YTKKeyValueStore.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    YTKKeyValueStore *store = [[YTKKeyValueStore alloc] initDBWithName:@"test.db"];
    NSString *tableName = @"user_table";
    [store createTableWithName:tableName];
    // 保存
    NSString *key = @"1";
    NSDictionary *user = @{@"id": @1, @"name": @"tangqiao", @"age": @30};
    [store putObject:user withId:key intoTable:tableName];
     key = @"2";

    user = @{@"id": @2, @"namdde": @"tang我qiao", @"age": @30};
    [store putObject:user withId:key intoTable:tableName];
    key = @"3";

    user = @{@"id": @3, @"namde": @"ta五天佑iao", @"age": @30};
    key = @"4";

    [store putObject:user withId:key intoTable:tableName];
    key = @"5";

    user = @{@"id": @4, @"namde": @"tangqsiao", @"age": @30};
    [store putObject:user withId:key intoTable:tableName];
    // 查询
    NSDictionary *queryUser = [store getObjectById:key fromTable:tableName];
    NSLog(@"query data result: %@", queryUser);
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
