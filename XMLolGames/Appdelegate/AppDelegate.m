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
#import "XMUserInfo.h"
#import "XMNavViewController.h"
#import "XMDataStorage.h"
#import "XMHttpOperation.h"
#import "XMProgressView.h"
#import "BBobjectProgress.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    XMLeftViewController *leftVC = [[XMLeftViewController alloc]init];
    XMTabbarController *tababr = [[XMTabbarController alloc]init];
    XMSideViewController *sideVC = [XMSideViewController SideViewControllerWithLeftController:leftVC andMainController:tababr];
    [self setStatusStyle];
    self.window.rootViewController = sideVC;
    
    //推送通知
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



/** 程序进入后台 */
-(void)applicationDidEnterBackground:(UIApplication *)application{
    //进入后台后开始
    [XMUserInfo shareManager].enterBackgroundTime = [NSDate date];
    XMLog(@"程序进入后台，开始计时");
}
/** 程序进入前台.处于使用状态 */
-(void)applicationDidBecomeActive:(UIApplication *)application{
    
    NSString *isLogin = [XMDataStorage readinfoWithKey:@"XMinfo"];
    //已经登录了
    if (isLogin.length!=0) {
        XMLog(@"已经登录了");
        NSDate *date = [XMUserInfo shareManager].enterBackgroundTime;
        if (date) {
            NSCalendar *cal = [NSCalendar currentCalendar];
            
            unsigned int timeflags = NSCalendarUnitYear|
            NSCalendarUnitMonth |
            NSCalendarUnitDay |
            NSCalendarUnitHour |
            NSCalendarUnitMinute |
            NSCalendarUnitSecond;
            NSDateComponents *d =[cal components:timeflags fromDate:date toDate:[NSDate date] options:0];
            
            //得到进入后台多少时间。。。单位是秒
            long sec = [d hour]*3600 + [d minute]*60 +[d second];
            if (sec>=10) {
                XMLog(@"超过1分钟了,请重新登录");
//                XMMainViewController *mainVC = [[XMMainViewController alloc]init];
//                XMNavViewController *nav = [[XMNavViewController alloc]initWithRootViewController:mainVC];
//                [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:nav animated:YES completion:nil];
                //发送自动登录的信息
                [[NSNotificationCenter defaultCenter] postNotificationName:XMautoLoginNotification object:nil];
                
            }
        }
    }
    
}
















- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}




- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
