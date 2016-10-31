//
//  UIView+VKAddion.h
//  VKCssProtocolDemo
//
//  Created by Awhisper on 2016/10/31.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VKAddion)

@property(nonatomic,strong) NSNumber *cssClipBorder;

@property(nonatomic,strong) UIView *cssTopBorder;

@property(nonatomic,strong) UIView *cssBottomBorder;

@property(nonatomic,strong) UIView *cssRightBorder;

@property(nonatomic,strong) UIView *cssLeftBorder;

@property(nonatomic,strong) UIColor *cssTopBorderColor;

@property(nonatomic,strong) UIColor *cssLeftBorderColor;

@property(nonatomic,strong) UIColor *cssRightBorderColor;

@property(nonatomic,strong) UIColor *cssBottomBorderColor;

@property(nonatomic,strong) NSNumber *cssTopBorderWidth;

@property(nonatomic,strong) NSNumber *cssLeftBorderWidth;

@property(nonatomic,strong) NSNumber *cssRightBorderWidth;

@property(nonatomic,strong) NSNumber *cssBottomBorderWidth;

@end
