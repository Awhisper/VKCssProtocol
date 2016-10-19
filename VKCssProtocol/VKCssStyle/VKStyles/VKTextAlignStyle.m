//
//  VKTextAlignStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/19.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKTextAlignStyle.h"

@implementation VKTextAlignStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"text-align";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    NSTextAlignment align = 0;
    if ([value isKindOfClass:[NSString class]]) {
        NSString *alignstr = (NSString *)value;
        if ([alignstr isEqualToString:@"right"]) {
            align = NSTextAlignmentRight;
        }
        
        if ([alignstr isEqualToString:@"left"]) {
            align = NSTextAlignmentLeft;
        }
        
        if ([alignstr isEqualToString:@"center"]) {
            align = NSTextAlignmentCenter;
        }
        
        if ([alignstr isEqualToString:@"justify"]) {
            align = NSTextAlignmentJustified;
        }
    }else{
        return;
    }
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = target;
        [targetLb setTextAlignment:align];
    }
    
}
@end
