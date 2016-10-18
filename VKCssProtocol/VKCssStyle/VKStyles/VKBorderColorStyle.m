//
//  VKBorderColor.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderColorStyle.h"
#import "UIColor+VKUtlities.h"

@implementation VKBorderColorStyle


VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-color";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    if ([value isKindOfClass:[UIColor class]]) {
        if ([target respondsToSelector:@selector(setBackgroundColor:)]) {
            [(UIView *)target setBackgroundColor:value];
            return;
        }
    }
    
    if ([value isKindOfClass:[NSString class]]) {
        UIColor *color = [UIColor vk_convertStringToColor:value];
        [(UIView *)target setBackgroundColor:color];
        return;
    }
}

+(void)setTarget:(id)target BorderColor:(UIColor *)color{
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        view.layer.borderColor = color.CGColor;
    }
}


@end
