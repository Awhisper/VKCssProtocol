//
//  VKBorderRadiusStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/19.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderRadiusStyle.h"

@implementation VKBorderRadiusStyle


VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-radius";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    CGFloat radius = [value VKIdToCGFloat];
    
    if (radius <= 0) {
        return;
    }
    
    if ([target isKindOfClass:[UIView class]]) {
        UIView *view = (UIView *)target;
        view.layer.cornerRadius = radius;
        view.clipsToBounds = YES;
    }
}
@end
