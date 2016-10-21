//
//  NSObject+VKIdHelper.h
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/19.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSObject (VKIdHelper)

-(UIColor *)VKIdToColor;
-(NSInteger)VKIdToInt;
-(CGFloat)VKIdToCGFloat;
-(NSString *)VKIdToString;

@end
