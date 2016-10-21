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
#import "UIView+VKCssProtocol.h"
@interface VKCssHotReloader ()

@property (nonatomic,assign) BOOL isHotReload;

@property (nonatomic,strong) NSMutableArray<UIView *> *viewListenArr;

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
        self.viewListenArr = [[NSMutableArray alloc]init];
    }
    return self;
}

+(void)hotReloaderListenCssPath:(NSString *)path{
    [VKCssClassManager readCssFilePath:path];
    [[VKCssHotReloader singleton]startCSSPath:path];
}

+(void)startHotReloader{
    [[VKCssHotReloader singleton] watchJSFile:YES];
    [VKCssHotReloader singleton].isHotReload = YES;
}

+(void)endHotReloader{
    [VKCssHotReloader singleton].isHotReload = NO;
    [[VKCssHotReloader singleton].viewListenArr removeAllObjects];
    [[VKCssHotReloader singleton] watchJSFile:NO];
}

+(void)addHotReloaderTarger:(UIView *)target{
    if ([VKCssHotReloader singleton].isHotReload) {
        [[VKCssHotReloader singleton].viewListenArr addObject:target];
    }
    
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
        [VKCssClassManager reloadCssFile];
        [[VKCssHotReloader singleton] refreshListeningUI];
        NSLog(@"change======");
    }];
    [self.watchDogs addObject:watchDog];
#endif
}

-(void)refreshListeningUI
{
    for (UIView *view in [self.viewListenArr copy]) {
        [view refreshCSS];
    }
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
