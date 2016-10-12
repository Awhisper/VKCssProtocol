//
//  VKCssClassManager.m
//  CSSKitDemo
//
//  Created by Awhisper on 2016/10/11.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKCssClassManager.h"
#import "VKCssStyleManager.h"


//void defineCssClassFunc(NSString *format, ...){
//    va_list arglist;
//    va_start(arglist, format);
//    NSString *stringArg;
//    NSMutableArray *stringArr = [[NSMutableArray alloc]init];
//    while ((stringArg = va_arg(arglist, id))) {
//        [stringArr addObject:stringArg];
//    }
//    va_end(arglist);
//    [VKCssClassManager defineCssClassVarList:stringArr];
//}

@implementation VKCssClassManager
VK_DEF_SINGLETON

-(instancetype)init{
    self = [super init];
    if (self) {
        self.cssClassDic = [[NSMutableDictionary alloc]init];
    }
    return self;
}

+(void)addCssClassName:(NSString *)className SytleName:(NSString *)styleName styleValue:(id)styleValue{
    [[VKCssClassManager singleton]addCssClassName:className SytleName:styleName styleValue:styleValue];
}

-(void)addCssClassName:(NSString *)className SytleName:(NSString *)styleName styleValue:(id)styleValue{
    
    VKCssClassModal *cssclass = [self.cssClassDic objectForKey:className];
    if (!cssclass) {
        cssclass = [[VKCssClassModal alloc]initWithName:className];
    }
    
    [cssclass.styleDic setObject:styleValue forKey:styleName];
    [self.cssClassDic setObject:cssclass forKey:className];
    
}


+(void)defineCssClass:(NSString *)className StyleInfo:(NSArray *)info
{
    if ([info.firstObject isKindOfClass:[NSString class]]) {
        [VKCssClassManager defineCssClass:className StyleArr:info];
    }else if ([info.firstObject isKindOfClass:[NSDictionary class]]){
        [VKCssClassManager defineCssClass:className StyleDicArr:info];
    }
}

+(void)defineCssClass:(NSString *)className StyleArr:(NSArray *)styleArr
{
    for (NSString *style in styleArr) {
        if ([style rangeOfString:@":"].location != NSNotFound) {
            NSArray *styleItem = [style componentsSeparatedByString:@":"];
            NSString *styleName = styleItem.firstObject;
            NSString *styleValue = styleItem.lastObject;
            [VKCssClassManager addCssClassName:className SytleName:styleName styleValue:styleValue];
        }else if(style.length > 0){
            NSLog(@"style string is incorrect");
        }
    }
}

+(void)defineCssClass:(NSString *)className StyleDicArr:(NSArray *)styleDicArr
{
    for (NSDictionary *styleDic in styleDicArr) {
        for (NSString *stylekey in styleDic.allKeys) {
            id stylevalue = [styleDic objectForKey:stylekey];
            [VKCssClassManager addCssClassName:className SytleName:stylekey styleValue:stylevalue];
        }
    }
    
}

+(void)setCssClass:(id)target ClassName:(NSString *)className{
    [[VKCssClassManager singleton]setCssClass:target ClassName:className];
}

-(void)setCssClass:(id)target ClassName:(NSString *)className{
    VKCssClassModal *cssclass = [self.cssClassDic objectForKey:className];
    if (cssclass) {
        NSArray *styleKeyArr = cssclass.styleDic.allKeys;
        for (NSString *styleName in styleKeyArr) {
            id stylevalue = [cssclass.styleDic objectForKey:styleName];
            [VKCssStyleManager setCssStyle:target StyleName:styleName StyleValue:stylevalue];
        }
        
    }

}
@end
