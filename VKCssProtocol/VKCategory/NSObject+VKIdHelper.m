//
//  NSObject+VKIdHelper.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/19.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "NSObject+VKIdHelper.h"
#import "UIColor+VKUtlities.h"
@implementation NSObject (VKIdHelper)

-(id)VKIdToColor
{
    if ([self isKindOfClass:[UIColor class]]) {
        return self;
    }
    
    if ([self isKindOfClass:[NSString class]]) {
        UIColor *color = [UIColor vk_convertStringToColor:(NSString *)self];
        return color;
    }
    return nil;
}

-(NSInteger)VKIdToInt
{
    NSInteger value = 0;
    if ([self isKindOfClass:[NSString class]]) {
        NSString *valuestr = (NSString *)self;
        value = [valuestr integerValue];
    }
    
    if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *valuenum = (NSNumber *)self;
        value = [valuenum integerValue];
    }
    
    return value;
}

-(CGFloat)VKIdToCGFloat{
    
    CGFloat value = 0;
    if ([self isKindOfClass:[NSString class]]) {
        NSString *valuestr = (NSString *)self;
        value = [valuestr floatValue];
    }
    
    if ([self isKindOfClass:[NSNumber class]]) {
        NSNumber *valuenum = (NSNumber *)self;
        value = [valuenum floatValue];
    }
    
    return value;
}

-(NSString *)VKIdToString{
    if ([self isKindOfClass:[NSString class]]) {
        return (NSString *)self;
    }
    return nil;
}
@end
