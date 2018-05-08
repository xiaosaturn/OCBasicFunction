//
//  NSDate+Format.h
//  BasicFunction
//
//  Created by 斯盛123 on 2018/5/8.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Format)

+ (NSString *)timeFormat:(NSString *)timestamp;
+ (NSString *)getTimeStrWithString:(NSString *)str;
+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime;
+ (NSString *)stringToDateFormat:(NSString *)string;
+ (NSString *)timeFormatForConversationList:(NSString *)timestamp;

@end
