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
