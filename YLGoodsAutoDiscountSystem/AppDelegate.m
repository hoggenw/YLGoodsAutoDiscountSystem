//
//  AppDelegate.m
//  YLGoodsAutoDiscountSystem
//
//  Created by 千锋 on 16/3/2.
//  Copyright © 2016年 hoggenw. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
typedef NS_ENUM(NSInteger,kindOfDiscount){
    NODISCOUNT=0,
    PERCENTDISCOUNT=1,
    FULLREDUCE=2,
};
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    [userDef synchronize];
    NSDictionary *Dict1=@{@"ITEM000001":@[@"苹果",@(NODISCOUNT),@(5),@"斤"]};
    NSDictionary *Dict2=@{@"ITEM000002":@[@"羽毛球",@(PERCENTDISCOUNT),@(1),@"个"]};
    NSDictionary *Dict3=@{@"ITEM000003":@[@"篮球",@(FULLREDUCE),@(88),@"个"]};
    NSArray *array=@[Dict1,Dict2,Dict3];
    [userDef setObject:array forKey:@"DISCOUNT"];
    [userDef synchronize];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
