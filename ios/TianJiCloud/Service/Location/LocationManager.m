//
//  LocationManager.m
//  TianJiCloud
//
//  Created by 朱鹏 on 2017/8/31.
//  Copyright © 2017年 TianJiMoney. All rights reserved.
//

#import "LocationManager.h"
#import "CLPlacemark+YCPlacemark.h"


@interface LocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation LocationManager

+ (void)load{

    //[[LocationManager shareManager] startUpdatingLocation];
}

+ (LocationManager *)shareManager {
    static dispatch_once_t pred = 0;
    __strong static id _sharedObject = nil;
    dispatch_once(&pred, ^{
        _sharedObject = [[self alloc] init];
    });
    return _sharedObject;
}


#pragma mark - 开始定位

- (void)startUpdatingLocation{
    
    WEAK_SELF(self);
    [self requestForAuthorize:^(BOOL granted) {
        
        STRONG_SELF(self);
        if(granted){
        
            [self.manager startUpdatingLocation];
        }else{
        
            [self locationServicesDenied];
        }
    }];
}

#pragma mark - 权限处理

- (void)requestForAuthorize:(void(^)(BOOL granted))complete{
   
    BOOL loactionEnabled = [CLLocationManager locationServicesEnabled];
    if(!loactionEnabled) [self locationServicesNotEnabled];
    
    CLAuthorizationStatus authorizationStatus =  [CLLocationManager authorizationStatus];
    
    if(authorizationStatus == kCLAuthorizationStatusNotDetermined){
    
        [self.manager requestWhenInUseAuthorization];
        
        if(complete)complete(YES);
        
    }else if (authorizationStatus == kCLAuthorizationStatusRestricted ||
              authorizationStatus == kCLAuthorizationStatusDenied){
    
        if(complete)complete(NO);
    
    }else{
    
        if(complete)complete(YES);
    }
}


#pragma mark - getters

- (CLLocationManager *)manager{
 
    if(_manager == nil){
    
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        _manager.desiredAccuracy = kCLLocationAccuracyBest;
        _manager.distanceFilter = 10.f;
    }

    return _manager;
}


#pragma mark - <CLLocationManagerDelegate>

/*
 *  locationManager:didUpdateToLocation:fromLocation:
 *
 *  Discussion:
 *    Invoked when a new location is available. oldLocation may be nil if there is no previous location
 *    available.
 *
 *    This method is deprecated. If locationManager:didUpdateLocations: is
 *    implemented, this method will not be called.
 */
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation __OSX_AVAILABLE_BUT_DEPRECATED(__MAC_10_6, __MAC_NA, __IPHONE_2_0, __IPHONE_6_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{
    

    //反编码
    //CLPlacemark -> CLLocation -> CLLocationCoordinate2D {latitude,longitude}
    CLGeocoder *geocoder = [[CLGeocoder alloc]init];
    
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        CLPlacemark *placemark = [placemarks firstObject];
        
        //CLLocation *location = placemark.location;
        //CLRegion   *gegion   = placemark.region;
        //NSTimeZone *timeZone = placemark.timeZone;
        
        NSDictionary *addressDictionary = placemark.addressDictionary;
        
        NSString *formattedAddressLines = [addressDictionary[@"FormattedAddressLines"] firstObject];
        
        NSLog(@"%@",formattedAddressLines);
        
    }];

    [manager stopUpdatingLocation];
}

/*
 *  locationManager:didUpdateLocations:
 *
 *  Discussion:
 *    Invoked when new locations are available.  Required for delivery of
 *    deferred locations.  If implemented, updates will
 *    not be delivered to locationManager:didUpdateToLocation:fromLocation:
 *
 *    locations is an array of CLLocation objects in chronological order.
 */
/*
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations __OSX_AVAILABLE_STARTING(__MAC_10_9,__IPHONE_6_0){


}
 */

/*
 *  locationManager:didUpdateHeading:
 *
 *  Discussion:
 *    Invoked when a new heading is available.
 */
- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManagerShouldDisplayHeadingCalibration:
 *
 *  Discussion:
 *    Invoked when a new heading is available. Return YES to display heading calibration info. The display
 *    will remain until heading is calibrated, unless dismissed early via dismissHeadingCalibrationDisplay.
 */
- (BOOL)locationManagerShouldDisplayHeadingCalibration:(CLLocationManager *)manager  __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_3_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


    return NO;
}

/*
 *  locationManager:didDetermineState:forRegion:
 *
 *  Discussion:
 *    Invoked when there's a state transition for a monitored region or in response to a request for state via a
 *    a call to requestStateForRegion:.
 */
- (void)locationManager:(CLLocationManager *)manager
      didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_10,__IPHONE_7_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didRangeBeacons:inRegion:
 *
 *  Discussion:
 *    Invoked when a new set of beacons are available in the specified region.
 *    beacons is an array of CLBeacon objects.
 *    If beacons is empty, it may be assumed no beacons that match the specified region are nearby.
 *    Similarly if a specific beacon no longer appears in beacons, it may be assumed the beacon is no longer received
 *    by the device.
 */
- (void)locationManager:(CLLocationManager *)manager
        didRangeBeacons:(NSArray<CLBeacon *> *)beacons inRegion:(CLBeaconRegion *)region __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:rangingBeaconsDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when an error has occurred ranging beacons in a region. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
rangingBeaconsDidFailForRegion:(CLBeaconRegion *)region
              withError:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_7_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didEnterRegion:
 *
 *  Discussion:
 *    Invoked when the user enters a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
         didEnterRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_4_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didExitRegion:
 *
 *  Discussion:
 *    Invoked when the user exits a monitored region.  This callback will be invoked for every allocated
 *    CLLocationManager instance with a non-nil delegate that implements this method.
 */
- (void)locationManager:(CLLocationManager *)manager
          didExitRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_4_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didFailWithError:
 *
 *  Discussion:
 *    Invoked when an error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{


}

/*
 *  locationManager:monitoringDidFailForRegion:withError:
 *
 *  Discussion:
 *    Invoked when a region monitoring error has occurred. Error types are defined in "CLError.h".
 */
- (void)locationManager:(CLLocationManager *)manager
monitoringDidFailForRegion:(nullable CLRegion *)region
              withError:(NSError *)error __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_4_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didChangeAuthorizationStatus:
 *
 *  Discussion:
 *    Invoked when the authorization status changes for this application.
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status __OSX_AVAILABLE_STARTING(__MAC_10_7,__IPHONE_4_2){

    switch (status) {
            
        case kCLAuthorizationStatusAuthorizedAlways:
            NSLog(@"Always Authorized");
            break;
        case kCLAuthorizationStatusAuthorizedWhenInUse:
            NSLog(@"AuthorizedWhenInUse");
            break;
        case kCLAuthorizationStatusDenied:
            NSLog(@"Denied");
            break;
        case kCLAuthorizationStatusNotDetermined:
            NSLog(@"not Determined");
            break;
        case kCLAuthorizationStatusRestricted:
            NSLog(@"Restricted");
            break;
        default:
            break;
    }

}

/*
 *  locationManager:didStartMonitoringForRegion:
 *
 *  Discussion:
 *    Invoked when a monitoring for a region started successfully.
 */
- (void)locationManager:(CLLocationManager *)manager
didStartMonitoringForRegion:(CLRegion *)region __OSX_AVAILABLE_STARTING(__MAC_10_8,__IPHONE_5_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  Discussion:
 *    Invoked when location updates are automatically paused.
 */
- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  Discussion:
 *    Invoked when location updates are automatically resumed.
 *
 *    In the event that your application is terminated while suspended, you will
 *	  not receive this notification.
 */
- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_6_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didFinishDeferredUpdatesWithError:
 *
 *  Discussion:
 *    Invoked when deferred updates will no longer be delivered. Stopping
 *    location, disallowing deferred updates, and meeting a specified criterion
 *    are all possible reasons for finishing deferred updates.
 *
 *    An error will be returned if deferred updates end before the specified
 *    criteria are met (see CLError), otherwise error will be nil.
 */
- (void)locationManager:(CLLocationManager *)manager
didFinishDeferredUpdatesWithError:(nullable NSError *)error __OSX_AVAILABLE_STARTING(__MAC_10_9,__IPHONE_6_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

/*
 *  locationManager:didVisit:
 *
 *  Discussion:
 *    Invoked when the CLLocationManager determines that the device has visited
 *    a location, if visit monitoring is currently started (possibly from a
 *    prior launch).
 */
- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit __OSX_AVAILABLE_STARTING(__MAC_NA,__IPHONE_8_0) __TVOS_PROHIBITED __WATCHOS_PROHIBITED{


}

#pragma mark alert tool

- (void)locationServicesDenied{

    [self showAlert:@"定位服务不可用"
            message:@"请在iPhone的""设置-隐私-定位服务""中允许访问位置"
               sure:@"确定"];
}

- (void)locationServicesNotEnabled{
    
    [self showAlert:@"定位服务不可用"
            message:@""
               sure:@"确定"];
}

- (void)showAlert:(NSString *)title
          message:(NSString *)message
             sure:(NSString *)sure{
    
    ALERT.title(title).message(message).actionButtonColor(UIColorFromHEX(0x007AFF)).action(sure,NULL).show();
}




@end
