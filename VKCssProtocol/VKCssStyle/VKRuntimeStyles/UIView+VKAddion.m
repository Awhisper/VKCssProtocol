//
//  UIView+VKAddion.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/31.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "UIView+VKAddion.h"
#import <objc/runtime.h>
#import "UIView+VKMetrics.h"
@implementation UIView (VKAddion)

-(void)setCssClipBorder:(NSNumber *)cssClipBorder{
    objc_setAssociatedObject(self, @selector(cssClipBorder), cssClipBorder, OBJC_ASSOCIATION_RETAIN);
    [self vkRefreshBorder];
}

-(NSNumber *)cssClipBorder{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssTopBorder:(UIView *)cssTopBorder{
    objc_setAssociatedObject(self, @selector(cssTopBorder), cssTopBorder, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)cssTopBorder
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssLeftBorder:(UIView *)cssLeftBorder
{
    objc_setAssociatedObject(self, @selector(cssLeftBorder), cssLeftBorder, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)cssLeftBorder{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssRightBorder:(UIView *)cssRightBorder{
    objc_setAssociatedObject(self, @selector(cssRightBorder), cssRightBorder, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)cssRightBorder{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssBottomBorder:(UIView *)cssBottomBorder{
    objc_setAssociatedObject(self, @selector(cssBottomBorder), cssBottomBorder, OBJC_ASSOCIATION_RETAIN);
}

-(UIView *)cssBottomBorder
{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssTopBorderColor:(UIColor *)cssTopBorderColor{
    objc_setAssociatedObject(self, @selector(cssTopBorderColor), cssTopBorderColor, OBJC_ASSOCIATION_RETAIN);
}

-(UIColor *)cssTopBorderColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssRightBorderColor:(UIColor *)cssRightBorderColor{
    objc_setAssociatedObject(self, @selector(cssRightBorderColor), cssRightBorderColor, OBJC_ASSOCIATION_RETAIN);
}

-(UIColor *)cssRightBorderColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssBottomBorderColor:(UIColor *)cssBottomBorderColor{
    objc_setAssociatedObject(self, @selector(cssBottomBorderColor), cssBottomBorderColor, OBJC_ASSOCIATION_RETAIN);
}

-(UIColor *)cssBottomBorderColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssLeftBorderColor:(UIColor *)cssLeftBorderColor{
    objc_setAssociatedObject(self, @selector(cssLeftBorderColor), cssLeftBorderColor, OBJC_ASSOCIATION_RETAIN);
}

-(UIColor *)cssLeftBorderColor{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssTopBorderWidth:(NSNumber *)cssTopBorderWidth{
    objc_setAssociatedObject(self, @selector(cssTopBorderWidth), cssTopBorderWidth, OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber *)cssTopBorderWidth{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssLeftBorderWidth:(NSNumber *)cssLeftBorderWidth{
    objc_setAssociatedObject(self, @selector(cssLeftBorderWidth), cssLeftBorderWidth, OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber *)cssLeftBorderWidth{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssBottomBorderWidth:(NSNumber *)cssBottomBorderWidth{
    objc_setAssociatedObject(self, @selector(cssBottomBorderWidth), cssBottomBorderWidth, OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber *)cssBottomBorderWidth{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setCssRightBorderWidth:(NSNumber *)cssRightBorderWidth{
    objc_setAssociatedObject(self, @selector(cssRightBorderWidth), cssRightBorderWidth, OBJC_ASSOCIATION_RETAIN);
}

-(NSNumber *)cssRightBorderWidth{
    return objc_getAssociatedObject(self, _cmd);
}


//+(void)load
//{
//    Class class = [self class];
//    SEL origSelector = @selector(setNeedsDisplay);
//    SEL newSelector = @selector(vk_setNeedsDisplay);
//    
//    Method origMethod = class_getInstanceMethod(class,origSelector);
//    Method newMethod = class_getInstanceMethod(class,newSelector);
//    
//    if (origMethod && newMethod) {
//        method_exchangeImplementations(origMethod, newMethod);
//    }
//    
//}
//
//-(void)vk_setNeedsDisplay{
//    [self vk_setNeedsDisplay];
//    [self vkRefreshBorder];
//}

-(void)vkRefreshBorder{
    //top right bottom left
    if (!self.cssClipBorder) {
        return;
    }
    
    NSInteger topInt = 0x1000;
    NSInteger rightInt = 0x0100;
    NSInteger bottomInt = 0x0010;
    NSInteger leftInt = 0x0001;
    
    NSInteger currentBorder = [self.cssClipBorder integerValue];
    
    if (currentBorder & topInt) {
        if (!self.cssTopBorder) {
            self.cssTopBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width,0)];
        }
        self.cssTopBorder.height = [self.cssTopBorderWidth floatValue];
        self.cssTopBorder.backgroundColor = self.cssTopBorderColor;
    }else{
        [self.cssTopBorder removeFromSuperview];
        self.cssTopBorder = nil;
    }
    
    if (currentBorder & rightInt) {
        if (!self.cssRightBorder) {
            self.cssRightBorder = [[UIView alloc]initWithFrame:CGRectMake(0, self.width, 0,self.height)];
        }
        self.cssRightBorder.left = self.width - [self.cssRightBorderWidth floatValue];
        self.cssRightBorder.width = [self.cssRightBorderWidth floatValue];
        self.cssRightBorder.backgroundColor = self.cssRightBorderColor;
    }else{
        [self.cssRightBorder removeFromSuperview];
        self.cssRightBorder = nil;
    }
    
    if (currentBorder & bottomInt) {
        if (!self.cssBottomBorder) {
            self.cssBottomBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width,0)];
        }
        self.cssBottomBorder.top = self.height - [self.cssBottomBorderWidth floatValue];
        self.cssBottomBorder.height = [self.cssBottomBorderWidth floatValue];
        self.cssBottomBorder.backgroundColor = self.cssBottomBorderColor;
    }else{
        [self.cssBottomBorder removeFromSuperview];
        self.cssBottomBorder = nil;
    }
    
    if (currentBorder & leftInt) {
        if (!self.cssLeftBorder) {
            self.cssLeftBorder = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0,self.height)];
        }
        self.cssLeftBorder.width = [self.cssLeftBorderWidth floatValue];
        self.cssLeftBorder.backgroundColor = self.cssLeftBorderColor;
    }else{
        [self.cssLeftBorder removeFromSuperview];
        self.cssLeftBorder = nil;
    }
}

@end
