//
//  NSString+DeviceName.h
//  BasicFunction
//
//  Created by 斯盛123 on 2018/5/8.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <sys/types.h>
#include <sys/sysctl.h>

@interface NSString (DeviceName)

+ (NSString *)getDeviceName;
+ (BOOL)isiPhoneX;

@end
