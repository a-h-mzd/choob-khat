import 'dart:io';

import 'package:flutter_local_auth_invisible/flutter_local_auth_invisible.dart';

class Biometrics {
  static final _localAuth = LocalAuthentication();
  static Biometrics _instance = Biometrics._();

  factory Biometrics() {
    _instance ??= Biometrics._();
    return _instance;
  }

  Biometrics._();

  static Future<bool> get canAuth => _localAuth.canCheckBiometrics;

  Future<bool> authenticate() async {
    if (!(await canAuth)) return null;
    final availableBiometrics = await _localAuth.getAvailableBiometrics();
    if (Platform.isIOS) {
      if (!availableBiometrics.contains(BiometricType.face)) return null;
    } else if (Platform.isAndroid) {
      if (!availableBiometrics.contains(BiometricType.fingerprint)) return null;
    } else {
      throw UnsupportedError('not supported in ${Platform.operatingSystem}');
    }
    final response = await _localAuth.authenticateWithBiometrics(
      localizedReason: Platform.isAndroid
          ? 'انگشت خود را روی حسگر اثر انگشت قرار دهید.'
          : '',
    );
    return response;
  }
}
