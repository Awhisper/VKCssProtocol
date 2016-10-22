//
//  VKTextShadowStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKTextShadowStyle.h"

@implementation VKTextShadowStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"text-shadow";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    UIColor *color = [value VKIdToColor];
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = (UILabel *)target;
        targetLb.shadowColor = color;
        if (CGSizeEqualToSize(targetLb.shadowOffset, CGSizeZero)) {
            targetLb.shadowOffset = CGSizeMake(1, 0);
        }
    }
    
    if ([target isKindOfClass:[UIButton class]]) {
        UIButton *targetBt = (UIButton *)target;
        [targetBt setTitleShadowColor:color forState:UIControlStateNormal];
    }
}

@end
