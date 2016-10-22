//
//  VKTextDecorationStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKTextDecorationStyle.h"
#import "UILabel+VKAddion.h"
@implementation VKTextDecorationStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"text-decoration";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    NSString *decoration = [value VKIdToString];
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = (UILabel *)target;
        targetLb.cssDecoration = decoration;
    }
}

@end
