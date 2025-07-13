#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint custom_advanced_sms.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'custom_advanced_sms'
  s.version          = '1.2.0'
  s.summary          = 'An advanced SMS library for Flutter with enhanced functionality.'
  s.description      = <<-DESC
An advanced SMS library for Flutter with enhanced functionality. Allows sending, receiving,
and querying SMS messages, SMS delivery status, and contact information on Android, with sending capabilities on iOS & Web.
                       DESC
  s.homepage         = 'https://github.com/abualzait/custom_advanced_sms'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Abu Al-Zait' => 'abualzait@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '8.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
