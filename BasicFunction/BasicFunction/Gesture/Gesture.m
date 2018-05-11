//
//  Gesture.m
//  BasicFunction
//
//  Created by 斯盛123 on 2018/5/11.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Gesture.h"

@implementation Gesture

- (void)dragView{
    //拖动手势删除图片
    UIImageView *imageV = [[UIImageView alloc] init];
    UIPanGestureRecognizer *panGes = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragViewToOperate:)];
    [imageV addGestureRecognizer:panGes];
}

- (void)dragViewToOperate:(UITapGestureRecognizer *)x{
    UIView *view = [UIView new];
    UIPanGestureRecognizer *gesture = (UIPanGestureRecognizer *)x;
    if (gesture.state == UIGestureRecognizerStateBegan) {
        NSLog(@"FlyElephant---视图拖动开始");
    } else if (gesture.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [gesture locationInView:view];
        if (location.y < 0 || location.y > view.bounds.size.height) {
            return;
        }
        CGPoint translation = [gesture translationInView:view];
        NSLog(@"当前视图在View的位置:%@----平移位置:%@",NSStringFromCGPoint(location),NSStringFromCGPoint(translation));
        gesture.view.center = CGPointMake(gesture.view.center.x + translation.x, gesture.view.center.y + translation.y);
        [gesture setTranslation:CGPointZero inView:view];
    } else if (gesture.state == UIGestureRecognizerStateEnded || gesture.state == UIGestureRecognizerStateCancelled) {
        NSLog(@"FlyElephant---视图拖动结束");
        CGPoint p = gesture.view.center;
    }
}

@end
