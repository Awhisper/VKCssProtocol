//
//  VKBorderWidthStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/18.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderWidthStyle.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

@implementation VKBorderWidthStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-width";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    CGFloat width = [value VKIdToCGFloat];
    
    if (width <= 0) {
        return;
    }
    
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        view.layer.borderWidth = width;
        
        if ([view respondsToSelector:@selector(setCssBorderWidth:)]) {
            [view performSelector:@selector(setCssBorderWidth:) withObject:[NSNumber numberWithFloat:width]];
        }
    }

}

#pragma clang diagnostic pop


@end
