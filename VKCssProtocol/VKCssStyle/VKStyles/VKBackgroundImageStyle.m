//
//  VKBackgroundImageStyle.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/21.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKBackgroundImageStyle.h"

@implementation VKBackgroundImageStyle

VK_REGISTE_ATTRIBUTE()

+ (NSString *)styleName{
    return @"background-image";
}

+ (void)setTarget:(id)target styleValue:(id)value{
    NSString *imageName = [value VKIdToString];
    UIImage *image = [UIImage imageNamed:imageName];
    if ([target isKindOfClass:[UIImageView class]]) {
        [(UIImageView *)target setImage:image];
    }
    
    if ([target isKindOfClass:[UIButton class]]) {
        [(UIButton *)target setBackgroundImage:image forState:UIControlStateNormal];
    }
    
}
@end
