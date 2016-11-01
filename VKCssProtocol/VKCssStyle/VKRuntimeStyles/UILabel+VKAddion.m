//
//  UILabel+VKAddion.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "UILabel+VKAddion.h"
#import <objc/runtime.h>
#import "NSMutableAttributedString+VKAttributedString.h"
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
    self.text = self.text;
}

-(NSString *)cssTransform{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssDecoration:(NSString *)cssDecoration{
    objc_setAssociatedObject(self, @selector(cssDecoration), cssDecoration, OBJC_ASSOCIATION_RETAIN);
    self.text = self.text;
}

-(NSString *)cssDecoration{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssFontWeight:(NSString *)cssFontWeight{
    objc_setAssociatedObject(self, @selector(cssFontWeight), cssFontWeight, OBJC_ASSOCIATION_RETAIN);
    self.text = self.text;
}

-(NSString *)cssFontWeight
{
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
    
    if (self.cssDecoration || self.cssFontWeight) {
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:finalText];
        
        if ([self.cssDecoration isEqualToString:@"underline"]) {
            [str vk_setUnderlineStyle:kCTUnderlineStyleSingle modifier:kCTUnderlinePatternSolid];;
        }
        
        if ([self.cssDecoration isEqualToString:@"line-through"]) {
            [str vk_setThroughStyle:kCTUnderlineStyleSingle modifier:kCTUnderlinePatternSolid];;
        }
        
        if ([self.cssFontWeight isEqualToString:@"bold"]) {
            [str vk_setStrokeWidth:5];
        }
        
        [self setAttributedText:str];
        return;
    }
    
    [self vk_setText:finalText];
}

-(void)refreshLabelCSS{
    NSString *text = self.text;
    self.text = text;
}

@end
