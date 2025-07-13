# Migration Guide: From sms_advanced to custom_advanced_sms

This guide helps you migrate from the original `sms_advanced` package to the new `custom_advanced_sms` package with updated namespace compliance.

## Quick Migration (2 steps)

### 1. Update pubspec.yaml

**Before:**
```yaml
dependencies:
  sms_advanced: ^1.1.0
```

**After:**
```yaml
dependencies:
  custom_advanced_sms: ^1.2.0
```

### 2. Update import statements

**Before:**
```dart
import 'package:sms_advanced/sms_advanced.dart';
```

**After:**
```dart
import 'package:custom_advanced_sms/custom_advanced_sms.dart';
```

## What Changed

### ✅ No Breaking Changes
- All existing APIs remain exactly the same
- Method signatures are unchanged
- Class names and functionality are identical
- Your existing code will work without modifications (except imports)

### 🔄 Updated for Compliance
- **Android namespace**: Now uses `com.abualzait.custom_advanced_sms`
- **Package name**: Changed from `sms_advanced` to `custom_advanced_sms`
- **Method channels**: Updated to use new namespace
- **Plugin classes**: Renamed to `CustomAdvancedSmsPlugin`

### 📈 Improvements
- ✅ Compliant with new Android build requirements
- ✅ Enhanced documentation and examples
- ✅ Better package organization
- ✅ Updated dependencies

## Step-by-Step Migration

### For Existing Projects:

1. **Update your pubspec.yaml**:
   ```bash
   # Remove old dependency
   flutter pub remove sms_advanced
   
   # Add new dependency
   flutter pub add custom_advanced_sms
   ```

2. **Update imports in all Dart files**:
   ```bash
   # Find all files with the old import
   grep -r "import 'package:sms_advanced" lib/
   
   # Replace with new import (or do manually in your IDE)
   find lib/ -name "*.dart" -exec sed -i '' 's/package:sms_advanced/package:custom_advanced_sms/g' {} \;
   ```

3. **Update import for main library**:
   ```dart
   // Change this:
   import 'package:sms_advanced/sms_advanced.dart';
   
   // To this:
   import 'package:custom_advanced_sms/custom_advanced_sms.dart';
   ```

4. **Test your app**:
   ```bash
   flutter clean
   flutter pub get
   flutter run
   ```

## API Reference (Unchanged)

All these APIs work exactly the same:

### Send SMS
```dart
SmsMessage message = SmsMessage('+1234567890', 'Hello World!');
await message.send();
```

### Receive SMS
```dart
SmsReceiver receiver = SmsReceiver();
receiver.onSmsReceived!.listen((SmsMessage message) {
  // Handle received SMS
});
```

### Query SMS
```dart
SmsQuery query = SmsQuery();
List<SmsMessage> messages = await query.querySms(
  kinds: [SmsMessageKind.Received, SmsMessageKind.Sent],
  start: 0,
  count: 10,
);
```

### Query Contacts
```dart
ContactQuery contactQuery = ContactQuery();
List<Contact> contacts = await contactQuery.queryContacts(
  contact: 'John',
  start: 0,
  count: 10,
);
```

## Android Namespace Update

If you're building an Android app, the new namespace ensures compliance with current Android requirements:

**Old namespace**: `com.elyudde.sms_advanced`
**New namespace**: `com.abualzait.custom_advanced_sms`

This change is handled automatically by the plugin - no action needed on your part.

## Troubleshooting

### Issue: "Package not found"
**Solution**: Make sure you've updated both pubspec.yaml and import statements.

### Issue: "Method channel errors"
**Solution**: Ensure you're using the latest version (1.2.0+) and have run `flutter clean && flutter pub get`.

### Issue: "Android build fails"
**Solution**: The new package includes namespace fixes for Android compliance. Clean and rebuild:
```bash
flutter clean
cd android && ./gradlew clean
flutter pub get
flutter run
```

## Need Help?

If you encounter any issues during migration:
1. Check that all import statements are updated
2. Ensure you're using version 1.2.0 or higher
3. Run `flutter clean && flutter pub get`
4. Open an issue in the repository with details

## Benefits of Migration

- ✅ **Android Compliance**: Meets new Android namespace requirements
- ✅ **Future Proof**: Continues to receive updates and support
- ✅ **Same API**: No learning curve or code changes required
- ✅ **Better Documentation**: Enhanced guides and examples
