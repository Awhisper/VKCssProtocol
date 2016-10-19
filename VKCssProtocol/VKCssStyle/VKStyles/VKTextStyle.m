//
//  VKTextStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/19.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKTextStyle.h"

@implementation VKTextStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"text";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    if ([value isKindOfClass:[NSString class]]) {
        
        if ([target isKindOfClass:[UILabel class]]) {
            UILabel *targetLb = (UILabel *)target;
            targetLb.text = value;
        }
        
        if ([target isKindOfClass:[UIButton class]]) {
            UIButton *targetBt = (UIButton *)target;
            [targetBt setTitle:value forState:UIControlStateNormal];
        }
    }
}
@end
