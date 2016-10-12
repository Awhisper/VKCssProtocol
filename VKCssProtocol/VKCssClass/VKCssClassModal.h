//
//  VKCssClassModal.h
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VKCssClassModal : NSObject

@property (nonatomic,strong) NSString *className;

@property (nonatomic,strong) NSMutableDictionary *styleDic;

-(instancetype)initWithName:(NSString *)name;

@end
