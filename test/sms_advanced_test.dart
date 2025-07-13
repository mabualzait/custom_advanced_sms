import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:custom_advanced_sms/custom_advanced_sms.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.abualzait.com/querySMS');
  SmsQuery smsQuery = SmsQuery();

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      return [];
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getAllSms', () async {
    expect(await smsQuery.getAllSms, []);
  });
}
