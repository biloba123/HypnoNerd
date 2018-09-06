//
//  AppDelegate.m
//  HypnoNerd
//
//  Created by 吕晴阳 on 2018/9/2.
//  Copyright © 2018年 Lv Qingyang. All rights reserved.
//

#import <UserNotifications/UserNotifications.h>
#import "AppDelegate.h"
#import "HNHypnosisViewController.h"
#import "HNReminderViewController.h"
#import "HNQuizViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];

    HNHypnosisViewController *hcv = [HNHypnosisViewController new];
    HNReminderViewController *rvc = [HNReminderViewController new];
    HNQuizViewController *qvc= [HNQuizViewController new];
    UITabBarController *tbcv= [UITabBarController new];
    tbcv.viewControllers=@[hcv, rvc, qvc];
    self.window.rootViewController = tbcv;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

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
