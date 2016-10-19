//
//  VKBackgroundcolorStyle.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBackgroundcolorStyle.h"

@implementation VKBackgroundcolorStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"background-color";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    UIColor *color = [value VKIdToColor];
    if ([target isKindOfClass:[UIView class]]) {
        [(UIView *)target setBackgroundColor:color];
    }
}


@end
