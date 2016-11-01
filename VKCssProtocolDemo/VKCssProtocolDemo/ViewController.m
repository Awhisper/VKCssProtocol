//
//  ViewController.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/10.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "ViewController.h"
#import "VKCssProtocol.h"
#import "VKCssHotReloader.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)initCss{
    
#if TARGET_IPHONE_SIMULATOR
    //playground调试
    //JS测试包的本地绝对路径
    NSString *rootPath = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"projectPath"];;
    NSString *cssPath = [NSString stringWithFormat:@"%@%@", rootPath, @"/cssDemo.css"];
    
    [VKCssHotReloader hotReloaderListenCssPath:cssPath];
    [VKCssHotReloader startHotReloader];
#else
    VKLoadBundleCss(@"cssDemo");
    
//    @loadBundleCss(@"cssDemo");
//    @loadPathCss(@"xxx/xxx.css");
//    VKLoadBundleCss(@"cssDemo");
//    VKLoadPathCss(@"xxx/xxx.css");
    
#endif
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCss];
    
    UILabel *btabc = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, self.view.bounds.size.width - 40, 80)];
    btabc.text = @"commenView1 commenText1";
    [self.view addSubview:btabc];
    
    UILabel *lbabc = [[UILabel alloc]initWithFrame:CGRectMake(20, 150, self.view.bounds.size.width - 40, 80)];
    lbabc.text = @"commenView2 commenText1";
    [self.view addSubview:lbabc];
    
    UILabel *btabcd = [[UILabel alloc]initWithFrame:CGRectMake(20, 250, self.view.bounds.size.width - 40, 80)];
    btabcd.text = @"commenView1 commenText2";
    [self.view addSubview:btabcd];
    
    UILabel *lbabcd = [[UILabel alloc]initWithFrame:CGRectMake(20 , 350, self.view.bounds.size.width - 40, 80)];
    lbabcd.text = @"commenView2 commenText2";
    [self.view addSubview:lbabcd];
    
    
    btabc.cssClass = @"commenView1 commenText1";
    lbabc.cssClass = @"commenView2 commenText1";
    btabcd.cssClass = @"commenView1 commenText2";
    lbabcd.cssClass = @"commenView2 commenText2";
        
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [VKCssHotReloader endHotReloader];
}

@end
