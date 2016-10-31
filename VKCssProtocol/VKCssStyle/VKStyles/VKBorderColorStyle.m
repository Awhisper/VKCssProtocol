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
    UIColor *color = [value VKIdToColor];
    [self setTarget:target borderColor:color];
}

+(void)setTarget:(id)target borderColor:(UIColor *)color{
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        view.layer.borderColor = color.CGColor;
        
        if ([view respondsToSelector:@selector(setCssBorderColor:)]) {
            [view performSelector:@selector(setCssBorderColor:) withObject:color];
        }
        
    }
}


@end
