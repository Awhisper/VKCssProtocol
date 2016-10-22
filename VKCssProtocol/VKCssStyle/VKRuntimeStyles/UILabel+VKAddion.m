//
//  UILabel+VKAddion.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "UILabel+VKAddion.h"
#import <objc/runtime.h>
@implementation UILabel (VKAddion)

+(void)load
{
    Class class = [self class];
    SEL origSelector = @selector(setText:);
    SEL newSelector = @selector(vk_setText:);
    
    Method origMethod = class_getInstanceMethod(class,origSelector);
    Method newMethod = class_getInstanceMethod(class,newSelector);

    if (origMethod && newMethod) {
        method_exchangeImplementations(origMethod, newMethod);
    }

}

-(void)setCssTransform:(NSString *)cssTransform
{
    objc_setAssociatedObject(self, @selector(cssTransform), cssTransform, OBJC_ASSOCIATION_RETAIN);
}

-(NSString *)cssTransform{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)vk_setText:(NSString *)text{
    NSString *finalText = text;
    if (self.cssTransform) {
        if ([self.cssTransform isEqualToString:@"uppercase"]) {
            finalText = [text uppercaseString];
        }
        
        if ([self.cssTransform isEqualToString:@"lowercase"]) {
            finalText = [text lowercaseString];
        }
        
        if ([self.cssTransform isEqualToString:@"capitalize"]) {
            finalText = [text capitalizedString];
        }
    }
    
    [self vk_setText:finalText];
}

@end
