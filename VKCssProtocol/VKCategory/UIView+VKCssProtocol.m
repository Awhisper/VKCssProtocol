//
//  UIView+CSSKit.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "UIView+VKCssProtocol.h"
#import <objc/runtime.h>
#import "VKCssStyleManager.h"
#import "VKCssClassManager.h"
@implementation UIView (VKCssProtocol)

-(void)setCssClass:(NSString *)cssClass{
    NSArray *styleArr = [cssClass componentsSeparatedByString:@" "];
    for (NSString *classstr in styleArr) {
        if(classstr.length > 0){
            [VKCssClassManager setCssClass:self className:classstr];
        }
        
    }
    
    objc_setAssociatedObject(self, @selector(cssClass), cssClass, OBJC_ASSOCIATION_RETAIN);
    [self tryAddHotReloaderListener];
}

-(NSString *)cssClass{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssStyle:(NSString *)cssStyle
{
    NSArray *styleArr = [cssStyle componentsSeparatedByString:@" "];
    for (NSString *stylestr in styleArr) {
        if ([stylestr rangeOfString:@":"].location != NSNotFound) {
            NSArray *styleItem = [stylestr componentsSeparatedByString:@":"];
            NSString *styleName = styleItem.firstObject;
            NSString *styleValue = styleItem.lastObject;
            [VKCssStyleManager setCssStyle:self styleName:styleName styleValue:styleValue];
        }else if(stylestr.length > 0){
            NSLog(@"style string is incorrect");
        }
        
    }
    
    objc_setAssociatedObject(self, @selector(cssStyle), cssStyle, OBJC_ASSOCIATION_RETAIN);
    [self tryAddHotReloaderListener];
}

-(NSString *)cssStyle{
    return objc_getAssociatedObject(self, _cmd);;
}

-(void)tryAddHotReloaderListener{
    NSString *reloaderClassName = @"VKCssHotReloader";
    Class reloaderClass = NSClassFromString(reloaderClassName);
    if (reloaderClass) {
        [(id)reloaderClass performSelector:@selector(addHotReloaderTarger:) withObject:self];
    }
}


-(void)refreshCSS
{
    NSString *oldStyle = self.cssStyle;
    NSString *oldClass = self.cssClass;
    self.cssClass = oldClass;
    self.cssStyle = oldStyle;
}
@end
