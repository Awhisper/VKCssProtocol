//
//  VKCssStyleProtocol.h
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol VKCssStyleProtocol <NSObject>

+ (NSString *)styleName;

+ (void)setTarget:(id)target styleValue:(id)value;

@end
