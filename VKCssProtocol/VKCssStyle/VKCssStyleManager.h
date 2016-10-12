//
//  VKCssStyleManager.h
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+VKSingleton.h"
#import "VKCssStylePch.h"

#define VK_REGISTE_ATTRIBUTE() \
+ (void)load { [VKCssStyleManager registerCssStyle:self]; } \

@interface VKCssStyleManager : NSObject

VK_AS_SINGLETON

@property (nonatomic,strong) NSMutableDictionary<NSString *,Class> *styleClasses;

+ (void)registerCssStyle:(Class)style;

+ (void)setCssStyle:(id)target styleName:(NSString *)styleName styleValue:(NSString *)styleValue;


@end
