//
//  ViewController.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "VKCssProtocol.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)initCss{
    
    
    @defCssClass(defName(@"标准工具栏样式"),
                 defStyles(@"background-color:blue"));
    
    @defCssClass(defName(@"标准工具栏配字"),
                 defStyles(defStyle(@"font-color",@"black"),
                           defStyle(@"font-size",@"30")));
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCss];
    
    UIButton *btabc = [[UIButton alloc]initWithFrame:CGRectMake(40, 140, 100, 40)];
    [btabc setTitle:@"aaaa" forState:UIControlStateNormal];
    btabc.cssClass = @"标准工具栏配色 标准工具栏配字";
    [self.view addSubview:btabc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
