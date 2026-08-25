import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceMetaHelper {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  static String get platform {
    if (kIsWeb) return 'web';
    if (Platform.isIOS) return 'ios';
    if (Platform.isAndroid) return 'android';
    if (Platform.isMacOS) return 'macos';
    if (Platform.isWindows) return 'windows';
    if (Platform.isLinux) return 'linux';
    return 'unknown';
  }

  static Future<String> getDeviceId() async {
    if (kIsWeb) return 'web_id';
    try {
      if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.identifierForVendor ?? 'unknown_ios_id';
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.id;
      }
    } catch (e) {
      debugPrint('Error getting device ID: $e');
    }
    return 'unknown_id';
  }

  static Future<String> getDeviceName() async {
    if (kIsWeb) return 'web_browser';
    try {
      if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.name; // e.g., "iPhone 13 Pro Max"
      } else if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return '${androidInfo.brand} ${androidInfo.model}'; // e.g., "Samsung SM-G981B"
      }
    } catch (e) {
      debugPrint('Error getting device Name: $e');
    }
    return 'unknown_device';
  }

  static Future<String> getAppVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return '${packageInfo.version}+${packageInfo.buildNumber}';
    } catch (e) {
      debugPrint('Error getting app version: $e');
    }
    return '1.0.0'; // Fallback
  }
}
