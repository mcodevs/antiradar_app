//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<fl_location/FlLocationPlugin.h>)
#import <fl_location/FlLocationPlugin.h>
#else
@import fl_location;
#endif

#if __has_include(<flutter_activity_recognition/FlutterActivityRecognitionPlugin.h>)
#import <flutter_activity_recognition/FlutterActivityRecognitionPlugin.h>
#else
@import flutter_activity_recognition;
#endif

#if __has_include(<flutter_foreground_task/FlutterForegroundTaskPlugin.h>)
#import <flutter_foreground_task/FlutterForegroundTaskPlugin.h>
#else
@import flutter_foreground_task;
#endif

#if __has_include(<flutter_tts/FlutterTtsPlugin.h>)
#import <flutter_tts/FlutterTtsPlugin.h>
#else
@import flutter_tts;
#endif

#if __has_include(<geofence_service/GeofenceServicePlugin.h>)
#import <geofence_service/GeofenceServicePlugin.h>
#else
@import geofence_service;
#endif

#if __has_include(<geolocator_apple/GeolocatorPlugin.h>)
#import <geolocator_apple/GeolocatorPlugin.h>
#else
@import geolocator_apple;
#endif

#if __has_include(<google_maps_flutter_ios/FLTGoogleMapsPlugin.h>)
#import <google_maps_flutter_ios/FLTGoogleMapsPlugin.h>
#else
@import google_maps_flutter_ios;
#endif

#if __has_include(<shared_preferences_foundation/SharedPreferencesPlugin.h>)
#import <shared_preferences_foundation/SharedPreferencesPlugin.h>
#else
@import shared_preferences_foundation;
#endif

#if __has_include(<smart_auth/SmartAuthPlugin.h>)
#import <smart_auth/SmartAuthPlugin.h>
#else
@import smart_auth;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FlLocationPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlLocationPlugin"]];
  [FlutterActivityRecognitionPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterActivityRecognitionPlugin"]];
  [FlutterForegroundTaskPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterForegroundTaskPlugin"]];
  [FlutterTtsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterTtsPlugin"]];
  [GeofenceServicePlugin registerWithRegistrar:[registry registrarForPlugin:@"GeofenceServicePlugin"]];
  [GeolocatorPlugin registerWithRegistrar:[registry registrarForPlugin:@"GeolocatorPlugin"]];
  [FLTGoogleMapsPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleMapsPlugin"]];
  [SharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"SharedPreferencesPlugin"]];
  [SmartAuthPlugin registerWithRegistrar:[registry registrarForPlugin:@"SmartAuthPlugin"]];
}

@end
