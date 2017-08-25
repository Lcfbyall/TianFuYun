//
//  UIApplication+TJSAppVersion.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/7.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "UIApplication+TJSAppVersion.h"


@implementation UIApplication (TJSAppVersion)

+ (NSString *)tjs_bundleIdentifier{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleIdentifier  = [infoDictionary objectForKey:@"CFBundleIdentifier"];
    return bundleIdentifier;
}

+ (NSString *)tjs_minimumOSVersion{
  
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *minimumOSVersion  = [infoDictionary objectForKey:@"MinimumOSVersion"];
    return minimumOSVersion;
}

+ (NSString *)tjs_appverison{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version  = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return version;
}
+ (NSString *)tjs_abundleVersion{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *buildNo =[infoDictionary objectForKey:@"CFBundleVersion"];
    return buildNo;
}

// 1.

+ (NSString *)tjs_productName{
  
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *productName =[infoDictionary objectForKey:@""];
    return productName;
}

// 2.执行程序名，
// 默认与 PRODUCT_NAME 一致。
+ (NSString *)tjs_bundleExecutable{

    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleExecutable =[infoDictionary objectForKey:@"CFBundleExecutable"];
    return bundleExecutable;
}

// 3.Bundle name 简单来说就是 App 安装到 iOS 机子里的 App 文件夹名。
// 默认与 PRODUCT_NAME 一致
+ (NSString *)tjs_bundleName{
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleName =[infoDictionary objectForKey:@"CFBundleName"];
    return bundleName;
}

// 4.真正显示到用户屏幕上的 App 名称,
// 默认情况下Bundle Display Name就等同于Product Name
+ (NSString *)tjs_bundleDisplayName{
  
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *bundleDisplayName =[infoDictionary objectForKey:@"CFBundleDisplayName"];
    return bundleDisplayName;

}





/*
Printing description of infoDictionary:
{
    BuildMachineOSBuild = 16G29;
    CFBundleDisplayName = "\U5929\U5bcc\U4e91";
    CFBundleExecutable = TianJiCloud;
    CFBundleIcons =     {
        CFBundlePrimaryIcon =         {
            CFBundleIconFiles =             (
                                             AppIcon29x29,
                                             AppIcon40x40,
                                             AppIcon60x60
                                             );
        };
    };
    CFBundleIdentifier = "TianJiMoney.TianJiCloud";
    CFBundleInfoDictionaryVersion = "6.0";
    CFBundleName = TianJiCloud;
    CFBundleNumericVersion = 16809984;
    CFBundlePackageType = APPL;
    CFBundleShortVersionString = "1.0.0";
    CFBundleSupportedPlatforms =     (
                                      iPhoneOS
                                      );
    CFBundleVersion = 1;
    DTCompiler = "com.apple.compilers.llvm.clang.1_0";
    DTPlatformBuild = 14E8301;
    DTPlatformName = iphoneos;
    DTPlatformVersion = "10.3";
    DTSDKBuild = 14E8301;
    DTSDKName = "iphoneos10.3";
    DTXcode = 0833;
    DTXcodeBuild = 8E3004b;
    LSRequiresIPhoneOS = 1;
    MinimumOSVersion = "8.0";
    NSAppTransportSecurity =     {
        NSAllowsArbitraryLoads = 1;
    };
    NSCameraUsageDescription = "\U5929\U5bcc\U4e91\U60f3\U4f7f\U7528\U60a8\U7684\U6444\U50cf\U5934";
    NSPhotoLibraryUsageDescription = "\U5929\U5bcc\U4e91\U60f3\U4f7f\U7528\U60a8\U7684\U76f8\U518c";
    UIAppFonts =     (
                      ""
                      );
    UIDeviceFamily =     (
                          1
                          );
    UILaunchImages =     (
                          {
                              UILaunchImageMinimumOSVersion = "8.0";
                              UILaunchImageName = "LaunchImage-800-Portrait-736h";
                              UILaunchImageOrientation = Portrait;
                              UILaunchImageSize = "{414, 736}";
                          },
                          {
                              UILaunchImageMinimumOSVersion = "8.0";
                              UILaunchImageName = "LaunchImage-800-667h";
                              UILaunchImageOrientation = Portrait;
                              UILaunchImageSize = "{375, 667}";
                          },
                          {
                              UILaunchImageMinimumOSVersion = "7.0";
                              UILaunchImageName = "LaunchImage-700";
                              UILaunchImageOrientation = Portrait;
                              UILaunchImageSize = "{320, 480}";
                          },
                          {
                              UILaunchImageMinimumOSVersion = "7.0";
                              UILaunchImageName = "LaunchImage-700-568h";
                              UILaunchImageOrientation = Portrait;
                              UILaunchImageSize = "{320, 568}";
                          }
                          );
    UIRequiredDeviceCapabilities =     (
                                        arm64
                                        );
    UIStatusBarTintParameters =     {
        UINavigationBar =         {
            Style = UIBarStyleDefault;
            Translucent = 0;
        };
    };
    UISupportedInterfaceOrientations =     (
                                            UIInterfaceOrientationPortrait
                                            );
}

*/



@end
