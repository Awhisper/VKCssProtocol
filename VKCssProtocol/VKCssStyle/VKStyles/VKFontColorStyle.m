//
//  VKFontColorStyle.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKFontColorStyle.h"
#import "UIColor+VKUtlities.h"

@implementation VKFontColorStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"color";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    UIColor *fontColor = [value VKIdToColor];
    
    if (!fontColor) {
        return;
    }
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = target;
        [targetLb setTextColor:fontColor];
    }
    
    if ([target isKindOfClass:[UIButton class]]) {
        UIButton *targetBt = (UIButton *)target;
        [targetBt setTitleColor:fontColor forState:UIControlStateNormal];
    }
    
}


@end
