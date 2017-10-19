//
//  AppVersionNetworkTool.m
//  TianJiCloud
//
//  Created by 朱鹏 on 17/7/25.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "AppVersionNetworkTool.h"

#import "TJSAppVersionApi.h"
#import "TJSAppInfo.h"

@implementation AppVersionNetworkTool

+ (void)requestWithParameters:(id)parameters successCallback:(TJSSuccessCompletionBlock)success failCallback:(TJSFailCompletionBlock)fail{

    //clientType:      1安卓 2IOS
    //buildNo:        当前APPbuild号  integer
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *ap_bundle= [infoDictionary objectForKey:@"CFBundleVersion"];
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    NSNumber *buildNo = [numberFormatter numberFromString:ap_bundle];
    
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:buildNo forKey:@""];
    [param setObject:@2      forKey:@""];
    
    
    TJSAppVersionApi *api = [[TJSAppVersionApi alloc]initWithParame:param];
    api.needLoading=NO;
    [api requestWithSuccessBlock:^(__kindof NSDictionary *  _Nullable data) {
        
        TJSAppInfo *appInfo;
        if(data.count){
            
            appInfo = [TJSAppInfo yy_modelWithJSON:data];
            if(appInfo.lastTimeVersionsNo==nil&&appInfo.newsVersionsNo==nil){
                appInfo=nil;
            }
        }
        success?success(appInfo):nil;
        
    } failureBlock:^(__kindof NSString * _Nullable msg, NSString * _Nullable code) {
        
       
        fail?fail(msg):nil;
        
        //        if(!msg && !code){
        //
        //            [TJSHudAlert showViewWithInfo:@"无法获取更新信息"];
        //        }
    }];

}

@end
