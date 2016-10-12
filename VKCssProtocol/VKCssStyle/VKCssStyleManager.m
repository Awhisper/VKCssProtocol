//
//  VKCssStyleManager.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssStyleManager.h"

@implementation VKCssStyleManager

VK_DEF_SINGLETON

+(void)registerCssStyle:(Class)style{
    [[VKCssStyleManager singleton]registerCssStyle:style];
}

-(void)registerCssStyle:(Class)style{
    if (!self.styleClasses) {
        self.styleClasses = [[NSMutableDictionary alloc]init];
    }
    
    NSCAssert([self checkStyleClass:style], @"style class doesn't conform to protocol VKCssStyleProtocol");
    
    NSString *styleName = [style styleName];
    if (styleName && styleName) {
        [self.styleClasses setObject:style forKey:styleName];
    }
}

-(BOOL)checkStyleClass:(Class)style
{
    if (![style conformsToProtocol:@protocol(VKCssStyleProtocol)]){
        return NO;
    }
    
    if (![(id)style respondsToSelector:@selector(styleName)]) {
        return NO;
    }
    
    if (![(id)style respondsToSelector:@selector(setTarget:styleValue:)]) {
        return NO;
    }
    
    return YES;
}

+(void)setCssStyle:(id)target styleName:(NSString *)styleName styleValue:(NSString *)styleValue
{
    [[VKCssStyleManager singleton] setCssStyle:target styleName:styleName styleValue:styleValue];
}

-(void)setCssStyle:(id)target styleName:(NSString *)styleName styleValue:(NSString *)styleValue
{
    Class<VKCssStyleProtocol> targetStyle = [self.styleClasses objectForKey:styleName];
    if (targetStyle) {
        [targetStyle setTarget:target styleValue:styleValue];
    }else{
        NSLog(@"%@ style class doesn't exist",styleName);
    }
}
@end
