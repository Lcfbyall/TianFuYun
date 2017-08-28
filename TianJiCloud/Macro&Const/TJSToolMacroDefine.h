//
//  TJSToolMacroDefine.h
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/7/21.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#ifndef TJSToolMacroDefine_h
#define TJSToolMacroDefine_h


//1.系统尺寸
#define SCREEN_BOUNDS ([[UIScreen mainScreen] bounds])
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))


//2.系统判断
//字符串是根据ascii  compare 比较字符串的时候是按照 ascii码来比较的 如果你的系统时10.0 的 那么 “9.0”>”10.0”的
#define IOS6_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"6.0"  options:NSNumericSearch]!= NSOrderedAscending)
#define IOS7_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"  options:NSNumericSearch]!= NSOrderedAscending)
#define IOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"  options:NSNumericSearch]!= NSOrderedAscending)
#define IOS9_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"9.0"  options:NSNumericSearch]!= NSOrderedAscending)
#define IOS10_OR_LATER  ([[[UIDevice currentDevice] systemVersion] compare:@"10.0" options:NSNumericSearch]!= NSOrderedAscending)

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


// 3. 获取通过 xib 创建的 view
#define LOAD_XIB(className) [[[NSBundle mainBundle] loadNibNamed:((Str(className))) owner:nil options:nil] lastObject];
// 注册 xib cell
#define REGISTER_NIB_CELL(tableView,cellClass) [tableView registerNib:[UINib nibWithNibName:(Str(cellClass)) bundle:nil] \
forCellReuseIdentifier:(Str(cellClass))];
//UIStoryboard
#define LOAD_Storyboard(name,identifier) [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:identifier]
//获取图片资源
#define IMAGE(imageName) [UIImage imageNamed:imageName]
#define IMAGESize(imageName,imgsize) [UIImage tjs_imageNamed:imageName size:imgsize]
#define IMAGEOriginal(imageName)  [UIImage tjs_imageNamed:imageName renderingMode:UIImageRenderingModeAlwaysOriginal]
#define IMAGEOriginalSize(imageName,imgsize) [UIImage tjs_imageNamed:imageName size:imgsize  renderingMode:UIImageRenderingModeAlwaysOriginal]



//4. color
#define UIColorFromHEX(rgbHexValue) [UIColor colorWithRed:((float)(((rgbHexValue) & 0xFF0000) >> 16))/255.0 \
green:((float)(((rgbHexValue) & 0x00FF00) >> 8))/255.0 \
blue:((float)((rgbHexValue) & 0x0000FF))/255.0 \
alpha:1.0]

#define RGB(__r, __g, __b)  [UIColor colorWithRed:(1.0*(__r)/255)\
green:(1.0*(__g)/255)\
blue:(1.0*(__b)/255)\
alpha:1.0]

#define RGBA(__r, __g, __b, __a)  [UIColor colorWithRed:(1.0*(__r)/255)\
green:(1.0*(__g)/255)\
blue:(1.0*(__b)/255)\
alpha:__a]



// 5. memory
#define WEAK_SELF(type)  __weak typeof(type) weak##type = type;
#define STRONG_SELF(type)  __strong typeof(type) type = weak##type;
#define kCFRelease(__REF) { if (nil != (__REF)) { CFRelease(__REF); __REF = nil; } }


//6. G－C－D
#define BACK_Async(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN_Async(block) dispatch_async(dispatch_get_main_queue(),block)
//code time
#define TICK   NSDate *startTime_TICK = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime_TICK timeIntervalSinceNow])



//7. 由角度获取弧度 有弧度获取角度
#define degreesToRadian(x) (M_PI * (x) / 180.0)
#define radianToDegrees(radian) (radian * 180.0)/(M_PI)
//枚举值转字符串
#define enumToString(value)  @#value


//8. 空判断
#define IS_NIL(_obj)     ((nil == _obj) || [_obj isKindOfClass:[NSNull class]])
#define STRING_IS_EMPTY(_obj)    (_obj.length == 0)
#define STRING_IS_WHITHESPACE(_obj) ([[_obj stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0)
#define STRING_IS_NOTNIL_NOTEMPTY(_obj)   ((!IS_NIL(_obj)) && (!STRING_IS_EMPTY(_obj)))
#define STRING_IS_NOTNIL_NOTEMPTY_NOTWHITHESPACE(_obj) ((!IS_NIL(_obj)) && (!STRING_IS_EMPTY(_obj)) && (!STRING_IS_WHITHESPACE(_obj)))
//数组是否为空
#define ARRAY_IS_EMPTY(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define DICT_IS_EMPTY(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)


// 9.
/********************************************/
//在release中才会定义 __OPTIMIZE__ !
#ifndef __OPTIMIZE__

//#define NSLog(...) NSLog(__VA_ARGS__)

#else
//release情况下，从这里进入（正式打包），发布正式服

//#define NSLog(...){}

#endif


//10.
//NSLog(...)
#ifndef __OPTIMIZE__
#define NSLog(format, ...)                     \
do {                                           \
fprintf(stderr, "\n----------开始打印----------\n<%s : %d> %s\n",    \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],__LINE__,__func__);\
(NSLog)((format), ##__VA_ARGS__);          \
fprintf(stderr, "----------结束打印-------\n\n");      \
\
} while (0)
#else
#define NSLog(...)
#endif

/********************************************/


//11.

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)



#endif /* TJSToolMacroDefine_h */
