import 'dart:async';

import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:web/web.dart' as web;

/// A web implementation of the CustomAdvancedSms plugin.
class CustomAdvancedSmsPlugin extends PlatformInterface {
  CustomAdvancedSmsPlugin() : super(token: _token);

  static final Object _token = Object();

  static CustomAdvancedSmsPlugin _instance = CustomAdvancedSmsPlugin();

  /// The default instance of [CustomAdvancedSmsPlugin] to use.
  ///
  /// Defaults to [MethodChannelCustomAdvancedSmsPlugin].
  static CustomAdvancedSmsPlugin get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [CustomAdvancedSmsPlugin] when they register themselves.
  static set instance(CustomAdvancedSmsPlugin instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  static void registerWith(Registrar registrar) {
    final MethodChannel channel = MethodChannel(
      'plugins.abualzait.com/sendSMS',
      const JSONMethodCodec(),
      registrar,
    );

    final pluginInstance = CustomAdvancedSmsPlugin();
    channel.setMethodCallHandler(pluginInstance.handleMethodCall);
  }

  Future<dynamic> handleMethodCall(MethodCall call) async {
    switch (call.method) {
      case 'sendSMS':
        return sendSMS(call.arguments['address'].toString(),
            call.arguments['body'].toString());
      default:
        throw PlatformException(
          code: 'Unimplemented',
          details: 'custom_advanced_sms for web doesn\'t implement \'${call.method}\'',
        );
    }
  }

  String get separator => isCupertino() ? "&" : "?";
  Future sendSMS(String address, String body) async {
    final _body = Uri.encodeComponent(body);
    final uri = Uri.parse('sms:$address${separator}body=$_body');
    return launchUrl(uri);
  }
}

bool isCupertino() {
  final _devices = [
    'iPad Simulator',
    'iPhone Simulator',
    'iPod Simulator',
    'iPad',
    'iPhone',
    'iPod',
    'Mac OS X',
  ];
  final String _agent = web.window.navigator.userAgent;
  for (final device in _devices) {
    if (_agent.contains(device)) {
      return true;
    }
  }
  return false;
}
