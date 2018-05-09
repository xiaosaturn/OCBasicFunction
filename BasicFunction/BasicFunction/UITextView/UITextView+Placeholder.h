//
//  UITextView+Placeholder.h
//  BasicFunction
//
//  Created by 斯盛123 on 2018/5/9.
//  Copyright © 2018年 Anker. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;

FOUNDATION_EXPORT double UITextView_PlaceholderVersionNumber;
FOUNDATION_EXPORT const unsigned char UITextView_PlaceholderVersionString[];

@interface UITextView (Placeholder)

@property (nonatomic, readonly) UILabel *placeholderLabel;
@property (nonatomic, strong) IBInspectable NSString *placeholder;
@property (nonatomic, strong) NSAttributedString *attributedPlaceholder;
@property (nonatomic, strong) IBInspectable UIColor *placeholderColor;

+ (UIColor *)defaultPlaceholderColor;

@end
