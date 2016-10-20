//
//  VKCssHotReloader.m
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/20.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssHotReloader.h"
#import "SGDirWatchdog.h"
@interface VKCssHotReloader ()

@property (nonatomic,strong) NSString *rootPath;

@property (nonatomic,strong) NSMutableArray<SGDirWatchdog *> *watchDogs;

@end

@implementation VKCssHotReloader
VK_DEF_SINGLETON

-(void)startCSSPath:(NSString *)mainScriptPath
{
#if TARGET_IPHONE_SIMULATOR
    self.rootPath = mainScriptPath;
    
    NSString *scriptRootPath = [mainScriptPath stringByDeletingLastPathComponent];
    
    NSArray *contentOfFolder = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:scriptRootPath error:NULL];
    [self watchFolder:scriptRootPath mainScriptPath:mainScriptPath];
    
    if ([scriptRootPath rangeOfString:@".app"].location != NSNotFound) {
        NSString *apphomepath = [scriptRootPath stringByDeletingLastPathComponent];
        [self watchFolder:apphomepath mainScriptPath:mainScriptPath];
    }
    
    for (NSString *aPath in contentOfFolder) {
        NSString * fullPath = [scriptRootPath stringByAppendingPathComponent:aPath];
        BOOL isDir;
        if ([[NSFileManager defaultManager] fileExistsAtPath:fullPath isDirectory:&isDir] && isDir) {
            [self watchFolder:fullPath mainScriptPath:mainScriptPath];
        }
    }
#endif
}


- (void)watchFolder:(NSString *)folderPath mainScriptPath:(NSString *)mainScriptPath
{
#if TARGET_IPHONE_SIMULATOR
    SGDirWatchdog *watchDog = [[SGDirWatchdog alloc] initWithPath:mainScriptPath update:^{
//        [self reload];
        NSLog(@"change======");
    }];
    [self.watchDogs addObject:watchDog];
#endif
}


@end
