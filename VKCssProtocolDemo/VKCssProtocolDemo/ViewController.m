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
    [VKCssClassManager addCssClassName:@"AKai背景色" SytleName:@"background-color" styleValue:@"yellow"];
    
    //    [VKCssClassManager addCssClassName:@"AKai标题字色字号" SytleName:@"font-color" styleValue:@"black"];
    //
    //    [VKCssClassManager addCssClassName:@"AKai标题字色字号" SytleName:@"font-size" styleValue:@"30"];
    
    @defCssClass(defName(@"AKai背景色"),
                 defStyles(@"background-color:yellow"));
    
    //    @defCssClass(defName(@"AKai标题字色字号"),
    //                    defStyles(@"font-color:black",@"font-size:30"));
    
    @defCssClass(defName(@"AKai标题字色字号"),
                 defStyles(defStyle(@"font-color",@"black"),
                           defStyle(@"font-size",@"30")));
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    UIView *abc = [[UIView alloc]initWithFrame:CGRectMake(40, 40, 100, 100)];
    //    abc.cssClass = @"凯哥的一号标题";
    //    [self.view addSubview:abc];
    
    [self initCss];
    
    UIButton *btabc = [[UIButton alloc]initWithFrame:CGRectMake(40, 140, 100, 40)];
    //    @cssStyleProtocol(btabc,@"background-color:yellow font-color:black font-size:30");
    @classProtocol(btabc,@"AKai标题字色字号 AKai背景色")
    [btabc setTitle:@"aaaa" forState:UIControlStateNormal];
    [self.view addSubview:btabc];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
