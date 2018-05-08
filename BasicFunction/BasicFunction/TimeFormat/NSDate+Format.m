//
//  NSDate+Format.m
//  BasicFunction
//
//  Created by 斯盛123 on 2018/5/8.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import "NSDate+Format.h"

@implementation NSDate (Format)

+ (NSString *)timeFormat:(NSString *)timestamp{
    double timeInterval = [timestamp doubleValue];
    if(timeInterval > 140000000000) {
        timeInterval = timeInterval / 1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //今天
    if ([date isToday]) {
        formatter.dateFormat = @"HH:mm";
        return [formatter stringFromDate:date];
    }else{
        //昨天
        if ([date isYesterday]) {
            formatter.dateFormat = @"昨天HH:mm";
            return [formatter stringFromDate:date];
        }else if ([date isSameWeek]){
            //            formatter.dateFormat = [NSString stringWithFormat:@"%@%@",[date weekdayStringFromDate],@"HH:mm"];
            formatter.dateFormat = [NSString stringWithFormat:@"%@ HH:mm",[date weekdayStringFromDate]];
            return [formatter stringFromDate:date];
        }else{
            formatter.dateFormat = @"YYYY-MM-dd HH:mm";
            return [formatter stringFromDate:date];
        }
    }
    return nil;
}

+ (NSString *)timeFormatForConversationList:(NSString *)timestamp{
    double timeInterval = [timestamp doubleValue];
    if(timeInterval > 140000000000) {
        timeInterval = timeInterval / 1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //今天
    if ([date isToday]) {
        formatter.dateFormat = @"HH:mm";
        return [formatter stringFromDate:date];
    }else{
        //昨天
        if ([date isYesterday]) {
            formatter.dateFormat = @"昨天";
            return [formatter stringFromDate:date];
        }else if ([date isSameWeek]){
            //            formatter.dateFormat = [NSString stringWithFormat:@"%@%@",[date weekdayStringFromDate],@"HH:mm"];
            formatter.dateFormat = [NSString stringWithFormat:@"%@",[date weekdayStringFromDate]];
            return [formatter stringFromDate:date];
        }else{
            formatter.dateFormat = @"MM-dd";
            return [formatter stringFromDate:date];
        }
    }
    return nil;
}

//是否在同一周
- (BOOL)isSameWeek{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear ;
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

//根据日期求星期几
- (NSString *)weekdayStringFromDate{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    return [weekdays objectAtIndex:theComponents.weekday];
}

//是否为今天
- (BOOL)isToday
{
    //now: 2015-09-05 11:23:00
    //self 调用这个方法的对象本身
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear ;
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

//是否为昨天
- (BOOL)isYesterday{
    //2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    //2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    //获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    return cmps.day == 1;
}

//格式化
- (NSDate *)dateWithYMD{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}

//指定格式的时间转换成字符串
+ (NSString *)getTimeStrWithString:(NSString *)str{
    NSString *formatStr = [[str componentsSeparatedByString:@"."] firstObject];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];    // 创建一个时间格式化对象
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];           //设定时间的格式
    NSDate *tempDate = [dateFormatter dateFromString:formatStr];              //将字符串转换为时间对象
    NSString *timeStr = [NSString stringWithFormat:@"%ld", (long)[tempDate timeIntervalSince1970]];
    return timeStr;
}

//比较两个时间差
+ (NSTimeInterval)pleaseInsertStarTime:(NSString *)starTime andInsertEndTime:(NSString *)endTime{
    double start = [starTime doubleValue];
    if(start > 140000000000) {
        start = start / 1000;
    }
    double end = [endTime doubleValue];
    if(end > 140000000000) {
        end = end / 1000;
    }
    NSDate *startDate = [NSDate dateWithTimeIntervalSince1970:start];
    NSDate *endDate = [NSDate dateWithTimeIntervalSince1970:end];
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}

//字符串转日期
+ (NSString *)stringToDateFormat:(NSString *)string{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [format dateFromString:string];
    [format setDateFormat:@"yyyy年MM月dd日"];
    return [format stringFromDate:date];
}

@end
