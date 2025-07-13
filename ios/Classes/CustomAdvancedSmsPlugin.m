#import "CustomAdvancedSmsPlugin.h"
#if __has_include(<custom_advanced_sms/custom_advanced_sms-Swift.h>)
#import <custom_advanced_sms/custom_advanced_sms-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "custom_advanced_sms-Swift.h"
#endif

@implementation CustomAdvancedSmsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [CustomAdvancedSmsPlugin registerWithRegistrar:registrar];
}
@end
