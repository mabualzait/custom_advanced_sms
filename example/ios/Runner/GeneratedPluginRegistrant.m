//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<custom_advanced_sms/CustomAdvancedSmsPlugin.h>)
#import <custom_advanced_sms/CustomAdvancedSmsPlugin.h>
#else
@import custom_advanced_sms;
#endif

#if __has_include(<url_launcher_ios/URLLauncherPlugin.h>)
#import <url_launcher_ios/URLLauncherPlugin.h>
#else
@import url_launcher_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [CustomAdvancedSmsPlugin registerWithRegistrar:[registry registrarForPlugin:@"CustomAdvancedSmsPlugin"]];
  [URLLauncherPlugin registerWithRegistrar:[registry registrarForPlugin:@"URLLauncherPlugin"]];
}

@end
