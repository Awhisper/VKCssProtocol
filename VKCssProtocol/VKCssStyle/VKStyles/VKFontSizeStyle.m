//
//  VKFontSizeStyle.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKFontSizeStyle.h"

@implementation VKFontSizeStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"font-size";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    CGFloat fontsize = [value VKIdToCGFloat];
    
    if (fontsize <= 0) {
        return;
    }
    
    
    UILabel *targetLb;
    
    if ([target isKindOfClass:[UILabel class]]) {
        targetLb = target;
    }
    
    if ([target isKindOfClass:[UIButton class]]) {
        UIButton *targetBt = (UIButton *)target;
        targetLb = targetBt.titleLabel;
    }
    
    
    UIFont *currentFont = targetLb.font;
    targetLb.font = [UIFont fontWithName:currentFont.fontName size:fontsize];

    
}

@end
