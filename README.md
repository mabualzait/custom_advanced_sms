# Custom Advanced SMS

> **Recent Fixes (v1.2.1):**
> - Package now passes all pub.dev validation checks
> - Added MIT LICENSE file
> - Fixed all import and dependency issues
> - Updated web implementation to use modern APIs
> - Minimum Android SDK is now 23
> - See CHANGELOG for details

An advanced SMS library for Flutter with enhanced functionality and improved namespace compliance. This library allows sending, receiving, and querying SMS messages, SMS delivery status, and contact information on Android, with sending capabilities on iOS & Web.

## Features

- 📱 **Send SMS Messages** - Send SMS on Android, iOS, and Web
- 📨 **Receive SMS Messages** - Listen for incoming SMS messages on Android
- 📋 **Query SMS Messages** - Search and filter SMS messages from the device
- 👥 **Query Contacts** - Access contact information and photos
- 📊 **SMS Delivery Status** - Track SMS delivery status
- 📞 **SIM Card Information** - Get information about available SIM cards
- 👤 **User Profile** - Access user profile information
- 🗑️ **Remove SMS** - Delete SMS messages from the device

## Platform Support

| Platform | Send SMS | Receive SMS | Query SMS | Query Contacts | SMS Status |
|----------|----------|-------------|-----------|----------------|------------|
| Android  | ✅        | ✅           | ✅         | ✅              | ✅          |
| iOS      | ✅        | ❌           | ❌         | ❌              | ❌          |
| Web      | ✅        | ❌           | ❌         | ❌              | ❌          |

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  custom_advanced_sms: ^1.2.1
```

> **Note:** Minimum Android SDK version is 23. The package includes a LICENSE file (MIT).

## Android Setup

Add the following permissions to your `android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.SEND_SMS" />
<uses-permission android:name="android.permission.RECEIVE_SMS" />
<uses-permission android:name="android.permission.READ_SMS" />
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.READ_PHONE_STATE" />
```

Ensure your app targets Android API level 23 or higher and includes the namespace in your `android/app/build.gradle`:

```gradle
android {
    namespace 'com.yourcompany.yourapp'
    compileSdkVersion 33
    // ... other configurations
}
```

## iOS Setup

For iOS, you can only send SMS messages. Add the following to your `ios/Runner/Info.plist`:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>sms</string>
</array>
```

## Usage

### Import the package

```dart
import 'package:custom_advanced_sms/custom_advanced_sms.dart';
```

### Send SMS

```dart
void sendSMS() async {
  SmsMessage message = SmsMessage('+1234567890', 'Hello World!');
  message.onStateChanged.listen((state) {
    if (state == SmsMessageState.Sent) {
      print("SMS sent successfully!");
    } else if (state == SmsMessageState.Delivered) {
      print("SMS delivered!");
    }
  });
  
  await message.send();
}
```

### Receive SMS (Android only)

```dart
void startListeningToSMS() {
  SmsReceiver receiver = SmsReceiver();
  receiver.onSmsReceived!.listen((SmsMessage message) {
    print('Received SMS from ${message.address}: ${message.body}');
  });
}
```

### Query SMS Messages (Android only)

```dart
void querySMS() async {
  SmsQuery query = SmsQuery();
  List<SmsMessage> messages = await query.querySms(
    kinds: [SmsMessageKind.Received, SmsMessageKind.Sent],
    address: '+1234567890', // Optional: filter by phone number
    start: 0,
    count: 10,
  );
  
  for (SmsMessage message in messages) {
    print('${message.address}: ${message.body}');
  }
}
```

### Query Contacts (Android only)

```dart
void queryContacts() async {
  ContactQuery contactQuery = ContactQuery();
  List<Contact> contacts = await contactQuery.queryContacts(
    contact: 'John', // Search term
    start: 0,
    count: 10,
  );
  
  for (Contact contact in contacts) {
    print('${contact.fullName}: ${contact.address}');
  }
}
```

### Get Contact Photo (Android only)

```dart
void getContactPhoto(Contact contact) async {
  if (contact.photo != null) {
    Uint8List? photoBytes = await contact.photo!.readAsBytes();
    if (photoBytes != null) {
      // Use the photo bytes to display the image
      print('Photo loaded: ${photoBytes.length} bytes');
    }
  }
}
```

### Remove SMS (Android only)

```dart
void removeSMS() async {
  // Remove by thread ID
  bool success = await SmsRemover.removeSmsById(123, SmsMessageKind.Sent);
  print('SMS removed: $success');
  
  // Remove by address
  int removedCount = await SmsRemover.removeSms('+1234567890', 0, 5);
  print('Removed $removedCount messages');
}
```

### Get SIM Card Information (Android only)

```dart
void getSimCards() async {
  SimCardsProvider provider = SimCardsProvider();
  List<SimCard> simCards = await provider.getSimCards();
  
  for (SimCard sim in simCards) {
    print('SIM ${sim.slot}: ${sim.displayName}');
  }
}
```

## Permissions

The library automatically handles permission requests on Android. Make sure to handle permission denied cases in your app:

```dart
void handlePermissions() async {
  // The library will automatically request permissions when needed
  // You can also manually check permissions if required
}
```

## Migration from sms_advanced

If you're migrating from the original `sms_advanced` package:

1. Update your `pubspec.yaml` to use `custom_advanced_sms`
2. Change import statements from `package:sms_advanced/sms_advanced.dart` to `package:custom_advanced_sms/custom_advanced_sms.dart`
3. All APIs remain the same, no code changes required

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Changelog

### 1.2.1
- Package now passes all pub.dev validation checks
- Added MIT LICENSE file
- Fixed all import and dependency issues
- Updated web implementation to use modern APIs
- Minimum Android SDK is now 23

### 1.2.0
- Updated namespace to comply with new Android requirements
- Enhanced package structure and organization
- Improved documentation and examples
- Maintained backward compatibility with original APIs

### Previous versions
- Based on the original sms_advanced package functionality
