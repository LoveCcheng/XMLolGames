//
//  AppDelegate.m
//  XMLolGames
//
//  Created by montnets on 2016/12/22.
//  Copyright © 2016年 montnets. All rights reserved.
//

#import "AppDelegate.h"

#import "XMSideViewController.h"
#import "XMLeftViewController.h"
#import "XMMainViewController.h"
#import "XMTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    XMLeftViewController *leftVC = [[XMLeftViewController alloc]init];
    XMTabbarController *tababr = [[XMTabbarController alloc]init];
    XMSideViewController *sideVC = [XMSideViewController SideViewControllerWithLeftController:leftVC andMainController:tababr];
    [self setStatusStyle];
    self.window.rootViewController = sideVC;
    
    
    if ([application respondsToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        //>=ios8
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge categories:nil]];
        [application registerForRemoteNotifications];
    }
//    else{
//        //<ios8
//        [application registerForRemoteNotificationTypes:UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge];
//    }
    
    return YES;
}
/** 设置状态栏颜色 */
-(void)setStatusStyle{
    //需要在info.plist文件里面设置 View controller-based status bar appearance    为NO
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}
/** 获取deviceToken */
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken{
    XMLog(@"token - %@",deviceToken);
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error{
    XMLog(@"获取deviceToken失败的原因 - %@",error);
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
