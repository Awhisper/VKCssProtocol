//
//  UILabel+VKAddion.h
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/22.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (VKAddion)

@property(nonatomic,strong) NSString *cssTransform;

@property(nonatomic,strong) NSString *cssDecoration;

@property(nonatomic,strong) NSString *cssFontWeight;

-(void)refreshLabelCSS;

@end
