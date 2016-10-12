//
//  VKCssClassManager.h
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+VKSingleton.h"
#import "VKCssClassModal.h"

#define defName(name) name
#define defStyle(key,value) (@{key:value})
#define defStyles(...) ((@[__VA_ARGS__]))

#define defCssClass(name,info) \
autoreleasepool{ [VKCssClassManager defineCssClass:name StyleInfo:info];}; \





@interface VKCssClassManager : NSObject
VK_AS_SINGLETON

@property (nonatomic,strong) NSMutableDictionary<NSString *,VKCssClassModal *> *cssClassDic;


+(void)defineCssClass:(NSString *)className StyleInfo:(NSArray *)info;

+(void)addCssClassName:(NSString *)className SytleName:(NSString *)styleName styleValue:(id)styleValue;


+(void)setCssClass:(id)target ClassName:(NSString *)className;

@end


