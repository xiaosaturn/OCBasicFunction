//
//  ViewController.m
//  BasicFunction
//
//  Created by 斯盛123 on 2018/4/26.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import "ViewController.h"
#import "UIApplication+Visible.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *nav = (UINavigationController *)[[UIApplication sharedApplication] visibleViewController];
    [nav pushViewController:self animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
