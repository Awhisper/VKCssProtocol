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
                 defStyles(@"background-color:yellow"));
    
    @defCssClass(defName(@"标准配字"),
                 defStyles(defStyle(@"color",@"black"),
                           defStyle(@"font-size",@"30")));
    
    @loadCssFile(@"cssClass");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCss];
    
    UIButton *btabc = [[UIButton alloc]initWithFrame:CGRectMake(0, 140, self.view.bounds.size.width, 40)];
    [btabc setTitle:@"aaaa" forState:UIControlStateNormal];
    btabc.cssClass = @"标准工具栏样式 标准配字";
    [self.view addSubview:btabc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
