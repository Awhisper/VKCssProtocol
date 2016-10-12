//
//  UIView+CSSKit.h
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

#define classProtocol(target,cssClasses) \
autoreleasepool{ target.cssClass = cssClasses;}; \

#define styleProtocol(target,cssStyles) \
autoreleasepool{ target.cssStyle = cssStyles;}; \

@interface UIView (VKCssProtocol)

@property(nonatomic,strong) NSString *cssStyle;
@property(nonatomic,strong) NSString *cssClass;

@end
