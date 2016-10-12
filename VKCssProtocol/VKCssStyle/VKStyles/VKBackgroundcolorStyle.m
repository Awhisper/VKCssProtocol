//
//  VKBackgroundcolorStyle.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBackgroundcolorStyle.h"
#import "UIColor+VKUtlities.h"

@implementation VKBackgroundcolorStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"background-color";
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


@end
