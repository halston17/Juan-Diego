//
//  AppDelegate.m
//  Juan Diego
//
//  Created by Austin Trujillo on 25 6 13.
//  Copyright (c) 2013 ATD. All rights reserved.
//
// No Comment


#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "PowerschoolViewController.h"


@implementation AppDelegate


    //      ************************************
    //      * Application Did Finish Launching *
    //      ************************************



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
    [Parse setApplicationId:@"BAIjvNdRhkUPB88Ajg47Ppy8bV0hj0HQ3zgML2Ex"
                  clientKey:@"ggF0i6emg3PLr0wZP8uqB0YVQRX15vg8FlCUplFz"];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [application registerForRemoteNotificationTypes:UIRemoteNotificationTypeBadge|
     
     UIRemoteNotificationTypeAlert|
     
     UIRemoteNotificationTypeSound];
    
    return YES;
    
}


    //      *********************
    //      * Register For Push *
    //      *********************


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    
    [PFPush storeDeviceToken:newDeviceToken];
    
    [PFPush subscribeToChannelInBackground:@"" target:self selector:@selector(subscribeFinished:error:)];

}


    //      *************************
    //      * Register Device Token *
    //      *************************



- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error {
    
    if ([result boolValue]) {
        
        NSLog(@"ParseStarterProject successfully subscribed to push notifications on the broadcast channel.");
        
    }
    
    else {
        
        NSLog(@"ParseStarterProject failed to subscribe to push notifications on the broadcast channel.");
        
    }
    
}


    //      *************************
    //      * Clear Badge Upon Open *
    //      *************************


-(void)applicationWillEnterForeground:(UIApplication *)application {
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
}



- (void) applicationDidBecomeActive:(UIApplication *)application{
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
}


-(void)applicationDidFinishLaunching:(UIApplication *)application {
    
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    
}


@end