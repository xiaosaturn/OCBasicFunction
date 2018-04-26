//
//  LocalNotification.m
//  BasicFunction
//
//  Created by 斯盛123 on 2018/4/26.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import "LocalNotification.h"
#import <UserNotifications/UserNotifications.h>

@implementation LocalNotification

- (void)createLocalNotification{
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:0.1 repeats:NO];
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.title = @"晓锟";
    content.body = @"在吗";
    content.badge = @(88);
    content.sound = [UNNotificationSound defaultSound];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"1" content:content trigger:trigger];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        
    }];
}

@end
