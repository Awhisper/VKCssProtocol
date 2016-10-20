//
//  VKCssHotReloader.h
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/20.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+VKSingleton.h"
@interface VKCssHotReloader : NSObject
VK_AS_SINGLETON

-(void)startCSSPath:(NSString *)mainScriptPath;
@end
