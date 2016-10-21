//
//  VKFontFamiltyStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKFontFamiltyStyle.h"

@implementation VKFontFamiltyStyle
VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"font-family";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    NSString *fontName = [value VKIdToString];
    
    if (!fontName) {
        return;
    }
    
    UILabel *targetLb = target;
    if ([target isKindOfClass:[UILabel class]]) {
        targetLb = target;
    }
    
    if ([target isKindOfClass:[UIButton class]]) {
        UIButton *targetBt = (UIButton *)target;
        targetLb = targetBt.titleLabel;
    }
    
    CGFloat fontsize = targetLb.font.pointSize;
    if ([fontName isEqualToString:@"systemFont"]) {
        targetLb.font = [UIFont systemFontOfSize:fontsize];
        return;
    }
    
    if ([fontName isEqualToString:@"boldSystemFont"]) {
        targetLb.font = [UIFont boldSystemFontOfSize:fontsize];
        return;
    }
    
    if ([fontName isEqualToString:@"italicSystemFont"]) {
        targetLb.font = [UIFont italicSystemFontOfSize:fontsize];
        return;
    }
    
    targetLb.font = [UIFont fontWithName:fontName size:fontsize];
    
    
}
@end
