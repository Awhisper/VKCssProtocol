//
//  VKFontWeightStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKFontWeightStyle.h"

@implementation VKFontWeightStyle


VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"font-weight";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    NSString *decoration = [value VKIdToString];
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = (UILabel *)target;
        targetLb.cssDecoration = decoration;
    }
}

@end
