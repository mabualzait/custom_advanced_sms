## 1.2.1 - Bug Fix Release

### Fixed
- 🐛 **Missing Android Implementations**: Added all missing Kotlin implementation files
- 🐛 **TelephonyManager Import**: Fixed `SimCardsProvider.kt` compilation errors
- 🐛 **Missing Classes**: Created all referenced provider and handler classes
- 🐛 **Android Manifest**: Fixed manifest parsing errors and permissions
- 🐛 **Build Issues**: Resolved compilation failures for Android builds

### Added
- ✅ **SimCardsProvider**: Complete implementation with SIM card detection
- ✅ **SmsReceiver**: Base implementation for SMS receiving functionality  
- ✅ **SmsSender**: Base implementation for SMS sending functionality
- ✅ **SmsQuery**: Base implementation for SMS querying functionality
- ✅ **ContactQuery**: Base implementation for contact querying functionality
- ✅ **SmsRemover**: Base implementation for SMS removal functionality
- ✅ **UserProfileProvider**: Base implementation for user profile functionality
- ✅ **Permissions**: Proper permission handling framework
- ✅ **SmsStateHandler**: SMS state monitoring implementation

### Technical Changes
- Created complete Android native implementation structure
- Added proper telephony and subscription manager imports
- Fixed Android manifest with required SMS and phone permissions
- Added proper error handling and security exception management
- Implemented proper SIM card state detection (Unknown, Absent, PinRequired, PukRequired, Locked, Ready)

### Other Recent Fixes
- Fixed package validation errors for pub.dev publishing
- Added LICENSE file (MIT)
- Fixed import in `custom_advanced_sms.dart` to use relative path for `contact.dart`
- Removed unnecessary import from `contact.dart`
- Updated web implementation to use `package:web` instead of deprecated `dart:html`
- Updated SMS sending on web to use `launchUrl` instead of deprecated `launch`
- Added `web` dependency to `pubspec.yaml`
- Ran `dart analyze` and fixed all issues
- Package now passes `dart pub publish --dry-run` with 0 warnings

## 1.2.0 - Custom Advanced SMS Release

### Added
- ✅ **New Namespace**: Updated to `com.abualzait.custom_advanced_sms` for Android compliance
- ✅ **Enhanced Documentation**: Comprehensive README with usage examples
- ✅ **Migration Guide**: Easy migration from original `sms_advanced` package
- ✅ **Improved Package Structure**: Better organization and naming conventions

### Changed
- 🔄 **Package Name**: Renamed from `sms_advanced` to `custom_advanced_sms`
- 🔄 **Android Namespace**: Updated to comply with new Android requirements
- 🔄 **Channel Names**: Updated method channel names to use new namespace
- 🔄 **Plugin Class Names**: Updated to `CustomAdvancedSmsPlugin`

### Technical Changes
- Updated Android build.gradle with new namespace
- Updated iOS podspec with new naming
- Updated Kotlin package declarations
- Updated Dart method channel references
- Maintained backward compatibility with existing APIs

### Migration
- All existing APIs remain unchanged for easy migration
- Simply update package name and import statements
- No breaking changes to existing functionality

---

## Previous Versions (from original sms_advanced)

## 1.1.0
* Update gradle and kotlin version
* Update example pubspec 
* Update doc and example with getUserProfile
* Add getUserProfile to query user info like phone number, full name
* **[BREAKING]** contactPhoto is no longer Uint8List?, but Photo? 

## 1.0.1
* Improve example 
* Update doc 
* Fixed issue where SMS would not get sent on higher Android API Level 

## 1.0.0
* Update dependencies
* Add SIM Card query
* Update example to demo SIM Card query

## 0.2.3
* Add SMS remove feature

## 0.2.2
* Add photo query feature from contact

## 0.2.1
* Add contact query feature

## 0.2.0
* Add get SMS feature - BREAKING CHANGE

## 0.1.2
* Update doc

## 0.1.1
* Update doc
* Update dependency

## 0.1.0
* First version
