//
//  VKBorderRightStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/31.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderRightStyle.h"
#import "UIView+VKAddion.h"
@implementation VKBorderRightStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-right";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    NSString *borderStr = [value VKIdToString];
    NSArray *strArr = [borderStr componentsSeparatedByString:@" "];
    
    NSNumber *width = nil;
    UIColor *color = nil;
    for (NSString *str in strArr) {
        if ([str rangeOfString:@"px"].location != NSNotFound) {
            width = [NSNumber numberWithFloat:[str VKIdToCGFloat]];
        }else{
            color = [str VKIdToColor];
        }
    }
    
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        if (color && width) {
            view.cssRightBorderWidth = width;
            view.cssRightBorderColor = color;
            NSInteger currentBorderInt = [view.cssClipBorder integerValue];
            currentBorderInt = currentBorderInt | 0x0100;
            view.cssClipBorder = [NSNumber numberWithInteger:currentBorderInt];
        }
    }
}

@end
