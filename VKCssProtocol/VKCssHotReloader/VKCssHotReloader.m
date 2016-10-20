//
//  VKCssHotReloader.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/20.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssHotReloader.h"
#import "SGDirWatchdog.h"
#import "VKCssClassManager.h"
@interface VKCssHotReloader ()

@property (nonatomic,strong) NSString *rootPath;

@property (nonatomic,strong) NSMutableArray<SGDirWatchdog *> *watchDogs;

@end

@implementation VKCssHotReloader
VK_DEF_SINGLETON

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.watchDogs = [[NSMutableArray alloc]init];
    }
    return self;
}

+(void)startHotReloaderWithCssPath:(NSString *)path{
    //playground调试
    //JS测试包的本地绝对路径
    NSString *rootPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"projectPath"];;
    
    NSString *scriptPath = [NSString stringWithFormat:@"%@%@", rootPath, @"/cssClass.css"];
    
    [VKCssClassManager readCssFilePath:scriptPath];
    
    [[VKCssHotReloader singleton]startCSSPath:scriptPath];
}

+(void)endHotReloader{
    [[VKCssHotReloader singleton] watchJSFile:NO];
}

-(void)startCSSPath:(NSString *)cssPath
{
#if TARGET_IPHONE_SIMULATOR
    self.rootPath = cssPath;
    
    NSString *cssRootPath = [cssPath stringByDeletingLastPathComponent];
    
    [self watchFolder:cssRootPath];
#endif
}


- (void)watchFolder:(NSString *)path
{
#if TARGET_IPHONE_SIMULATOR
    SGDirWatchdog *watchDog = [[SGDirWatchdog alloc] initWithPath:path update:^{
//        [VKCssClassManager reloadCssFile];
        NSLog(@"change======");
    }];
    [self.watchDogs addObject:watchDog];
    [watchDog start];
#endif
}


-(void)watchJSFile:(BOOL)watch
{
#if TARGET_IPHONE_SIMULATOR
    for (SGDirWatchdog *dog in self.watchDogs) {
        if (watch) {
            [dog start];
        }else{
            [dog stop];
        }
    }
#endif
}

@end
