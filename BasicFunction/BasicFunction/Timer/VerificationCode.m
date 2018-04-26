//
//  VerificationCode.m
//  BasicFunction
//
//  Created by 斯盛123 on 2018/4/26.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import "VerificationCode.h"
#import <UIKit/UIKit.h>

@implementation VerificationCode

- (void)setupTimer{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    __block NSInteger timeOut = 59;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(timer, ^{
        if (timeOut <= 0) {
            dispatch_source_cancel(timer);
            //主线程设置按钮样式-》
            dispatch_async(dispatch_get_main_queue(), ^{
                [btn setTitle:@"获取验证码" forState:UIControlStateNormal];
                [btn setUserInteractionEnabled:YES];
            });
        }else{
            //开始计时
            //剩余秒数 seconds
            NSInteger seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.1ld",(long)seconds];
            //主线程设置按钮样式
            dispatch_async(dispatch_get_main_queue(), ^{
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1.0];
                [btn setTitle:[NSString stringWithFormat:@"%@秒后重新发送",strTime] forState:UIControlStateNormal];
                [UIView commitAnimations];
                //计时器件不允许点击
                [btn setUserInteractionEnabled:NO];
            });
            timeOut--;
        }
    });
    dispatch_resume(timer);
}

@end
