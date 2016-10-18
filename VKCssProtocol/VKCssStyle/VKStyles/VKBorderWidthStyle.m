//
//  VKBorderWidthStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderWidthStyle.h"

@implementation VKBorderWidthStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-width";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    CGFloat width = 0;
    if ([value isKindOfClass:[NSString class]]) {
        NSString *valuestr = (NSString *)value;
        width = [valuestr floatValue];
    }
    
    if ([value isKindOfClass:[NSNumber class]]) {
        NSNumber *valuenum = (NSNumber *)value;
        width = [valuenum floatValue];
    }
    
    if (width <= 0) {
        return;
    }
    
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        view.layer.borderWidth = width;
    }

}

@end
