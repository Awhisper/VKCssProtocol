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
autoreleasepool{ [VKCssClassManager defineCssClass:name styleInfo:info];}; \

#define VKLoadBundleCss(css) \
@loadBundleCss(css); \

#define VKLoadPathCss(css) \
@loadPathCss(css);\

#define loadBundleCss(bundlefile) \
autoreleasepool{ [VKCssClassManager readBundleCssFile:bundlefile];}; \

#define loadPathCss(bundlefile) \
autoreleasepool{ [VKCssClassManager readCssFilePath:bundlefile];}; \

@interface VKCssClassManager : NSObject

VK_AS_SINGLETON

@property (nonatomic,strong) NSMutableDictionary<NSString *,VKCssClassModal *> *cssClassDic;


+ (void)defineCssClass:(NSString *)className styleInfo:(NSArray *)info;

+ (void)setCssClass:(id)target className:(NSString *)className;

+ (void)readBundleCssFile:(NSString *)cssFile;

+ (void)readCssFilePath:(NSString *)cssFilePath;

+ (void)reloadCssFile;

+ (void)clearCssFile;


@end


