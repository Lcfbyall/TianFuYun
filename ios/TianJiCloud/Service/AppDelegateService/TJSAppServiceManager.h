//
//  TJSAppServiceManager.h
//  TJSAppServiceLoader
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


#define TJS_EXPORT_SERVICE(name) \
+ (void)load {[[TJSAppServiceManager sharedManager] registerService:[self sharedManager]];} \
- (NSString *)serviceName { return @#name; }


NS_ASSUME_NONNULL_BEGIN

@protocol TJSAppService <UIApplicationDelegate>

@required
- (NSString *)serviceName;

@end



@interface TJSAppServiceManager : NSObject

+ (instancetype)sharedManager;

- (void)registerService:(id<TJSAppService>)service;

- (BOOL)proxyCanResponseToSelector:(SEL)aSelector;
- (void)proxyForwardInvocation:(NSInvocation *)anInvocation;

@end

NS_ASSUME_NONNULL_END
