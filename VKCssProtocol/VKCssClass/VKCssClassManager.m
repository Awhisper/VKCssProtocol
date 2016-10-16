//
//  VKCssClassManager.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssClassManager.h"
#import "VKCssStyleManager.h"

@implementation VKCssClassManager

VK_DEF_SINGLETON

-(instancetype)init{
    self = [super init];
    if (self) {
        self.cssClassDic = [[NSMutableDictionary alloc]init];
    }
    return self;
}

+(void)addCssClassName:(NSString *)className sytleName:(NSString *)styleName styleValue:(id)styleValue{
    [[VKCssClassManager singleton]addCssClassName:className sytleName:styleName styleValue:styleValue];
}

-(void)addCssClassName:(NSString *)className sytleName:(NSString *)styleName styleValue:(id)styleValue{
    
    VKCssClassModal *cssclass = [self.cssClassDic objectForKey:className];
    if (!cssclass) {
        cssclass = [[VKCssClassModal alloc]initWithName:className];
    }
    
    [cssclass.styleDic setObject:styleValue forKey:styleName];
    [self.cssClassDic setObject:cssclass forKey:className];
    
}


+(void)defineCssClass:(NSString *)className styleInfo:(NSArray *)info
{
    if ([info.firstObject isKindOfClass:[NSString class]]) {
        [VKCssClassManager defineCssClass:className styleStrArr:info];
    }else if ([info.firstObject isKindOfClass:[NSDictionary class]]){
        [VKCssClassManager defineCssClass:className styleDicArr:info];
    }
}

+(void)defineCssClass:(NSString *)className styleStrArr:(NSArray *)styleArr
{
    for (NSString *style in styleArr) {
        if ([style rangeOfString:@":"].location != NSNotFound) {
            NSArray *styleItem = [style componentsSeparatedByString:@":"];
            NSString *styleName = styleItem.firstObject;
            NSString *styleValue = styleItem.lastObject;
            [VKCssClassManager addCssClassName:className sytleName:styleName styleValue:styleValue];
        }else if(style.length > 0){
            NSLog(@"style string is incorrect");
        }
    }
}

+(void)defineCssClass:(NSString *)className styleDicArr:(NSArray *)styleDicArr
{
    for (NSDictionary *styleDic in styleDicArr) {
        for (NSString *stylekey in styleDic.allKeys) {
            id stylevalue = [styleDic objectForKey:stylekey];
            [VKCssClassManager addCssClassName:className sytleName:stylekey styleValue:stylevalue];
        }
    }
    
}

+(void)setCssClass:(id)target className:(NSString *)className{
    [[VKCssClassManager singleton]setCssClass:target className:className];
}

-(void)setCssClass:(id)target className:(NSString *)className{
    VKCssClassModal *cssclass = [self.cssClassDic objectForKey:className];
    if (cssclass) {
        NSArray *styleKeyArr = cssclass.styleDic.allKeys;
        for (NSString *styleName in styleKeyArr) {
            id stylevalue = [cssclass.styleDic objectForKey:styleName];
            [VKCssStyleManager setCssStyle:target styleName:styleName styleValue:stylevalue];
        }
        
    }

}

+(void)readBundleCssFile:(NSString *)cssFile
{
    NSString *cssFilePath = [[NSBundle mainBundle] pathForResource:cssFile ofType:@"css"];

    
    NSString *css = [NSString stringWithContentsOfFile:cssFilePath encoding:NSUTF8StringEncoding error:nil];
    
    [VKCssClassManager parseCssContent:css];
}

+(void)parseCssContent:(NSString *)cssContent
{
    NSScanner *theScanner = [NSScanner scannerWithString:cssContent];
    
    [theScanner setCaseSensitive: YES];
    [theScanner setScanLocation: 0];
    
    
    while (![theScanner isAtEnd]) {
        
        [theScanner scanUpToString:@"." intoString:nil];
        NSInteger cssClassNameStart = theScanner.scanLocation + 1;
        
        [theScanner scanUpToString:@"{" intoString:nil];
        NSInteger cssdefineStart = theScanner.scanLocation + 1;
        NSString *cssName = [cssContent substringWithRange:NSMakeRange(cssClassNameStart, cssdefineStart - cssClassNameStart - 1)];
        
        [theScanner scanUpToString:@"}" intoString:nil];
        NSInteger cssdefineEnd = theScanner.scanLocation + 1;
        
        NSString *cssDef = [cssContent substringWithRange:NSMakeRange(cssdefineStart, cssdefineEnd - cssdefineStart - 1)];
        
        cssName = [cssName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSArray *cssStyles = [cssDef componentsSeparatedByString:@";"];
        for (NSString *cssstyle in cssStyles) {
            NSString *style = [cssstyle stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            if ([style rangeOfString:@":"].location != NSNotFound) {
                NSArray *styleItem = [style componentsSeparatedByString:@":"];
                NSString *styleName = [styleItem.firstObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                NSString *styleValue = [styleItem.lastObject stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                [VKCssClassManager addCssClassName:cssName sytleName:styleName styleValue:styleValue];
            }else if(style.length > 0){
                NSLog(@"style string is incorrect");
            }
            
        }
    }
    
    NSLog(@"11");
}
@end
