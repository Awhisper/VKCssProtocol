//
//  VKBorderTopStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/31.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBorderTopStyle.h"

@implementation VKBorderTopStyle


VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"border-top";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
//    NSString *decoration = [value VKIdToString];
//    
//    if ([target isKindOfClass:[UILabel class]]) {
//        UILabel *targetLb = (UILabel *)target;
//        targetLb.cssDecoration = decoration;
//    }
}


@end
