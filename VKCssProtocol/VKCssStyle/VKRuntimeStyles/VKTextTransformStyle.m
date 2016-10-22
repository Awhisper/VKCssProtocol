//
//  VKTextTransformStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKTextTransformStyle.h"
#import "UILabel+VKAddion.h"
@implementation VKTextTransformStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"text-transform";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    
    NSString *transform = [value VKIdToString];
    
    if ([target isKindOfClass:[UILabel class]]) {
        UILabel *targetLb = (UILabel *)target;
        targetLb.cssTransform = transform;
    }
}

@end
