//
//  VKCssClassModal.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssClassModal.h"

@implementation VKCssClassModal

-(instancetype)initWithName:(NSString *)name{
    self = [super init];
    if (self) {
        self.styleDic = [[NSMutableDictionary alloc]init];
        self.className = name;
    }
    return self;
}
@end
